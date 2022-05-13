import 'dart:io';

import 'package:annix/models/anniv.dart';
import 'package:annix/models/metadata.dart';
import 'package:annix/services/audio_source.dart';
import 'package:annix/services/global.dart';
import 'package:annix/widgets/cover_image.dart';
import 'package:audio_service/audio_service.dart';
import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';
import 'package:just_audio/just_audio.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

abstract class BaseAnnilClient {
  Future<List<String>> getAlbums();

  Future<AudioSource> getAudio({
    required String albumId,
    required int discId,
    required int trackId,
    required PreferQuality preferBitrate,
  });

  String getCoverUrl({required String albumId, int? discId});
}

class OnlineAnnilClient implements BaseAnnilClient {
  final Dio client;
  final String id;
  String name;
  String url;
  String token;
  int priority;
  final bool local;

  // cached album list in client
  String eTag = "";
  List<String> albums = [];

  OnlineAnnilClient._({
    required this.id,
    required this.name,
    required this.url,
    required this.token,
    required this.priority,
    this.local = false,
  }) : client = Dio(BaseOptions(baseUrl: url));

  factory OnlineAnnilClient.remote({
    required String id,
    required String name,
    required String url,
    required String token,
    required int priority,
  }) {
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return OnlineAnnilClient._(
      id: id,
      name: name,
      url: url,
      token: token,
      priority: priority,
      local: false,
    );
  }

  factory OnlineAnnilClient.local({
    required String name,
    required String url,
    required String token,
    required int priority,
  }) =>
      OnlineAnnilClient._(
        id: Uuid().v4(),
        name: name,
        url: url,
        token: token,
        priority: priority,
        local: true,
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'token': token,
      'priority': priority,
      'local': local,
      'albums': albums,
      'etag': eTag,
    };
  }

  factory OnlineAnnilClient.fromJson(Map<String, dynamic> json) {
    final client = OnlineAnnilClient._(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      token: json['token'] as String,
      priority: json['priority'] as int,
      local: json['local'] as bool,
    );
    client.albums = (json['albums'] as List<dynamic>)
        .map((album) => album as String)
        .toList();
    client.eTag = json['etag'] as String;
    return client;
  }

  /// Get the available album list of an Annil server.
  Future<List<String>> getAlbums() async {
    try {
      final response = await client.get(
        '/albums',
        options: Options(
          responseType: ResponseType.json,
          headers: {
            'Authorization': token,
            'If-None-Match': eTag,
          },
        ),
      );
      final newETag = response.headers['etag']![0];
      FLog.debug(
        text: "Annil cache MISSED, old etag: $eTag, new etag: $newETag",
      );
      eTag = newETag;

      albums = (response.data as List<dynamic>)
          .map((album) => album.toString())
          .toList();
    } on DioError catch (e) {
      if (e.response?.statusCode == 304) {
        FLog.trace(text: "Annil cache HIT, etag: $eTag");
      } else {
        rethrow;
      }
    }
    return List.unmodifiable(albums);
  }

  Future<AudioSource> getAudio({
    required String albumId,
    required int discId,
    required int trackId,
    required PreferQuality preferBitrate,
  }) {
    return AnnilAudioSource.create(
      annil: this,
      albumId: albumId,
      discId: discId,
      trackId: trackId,
      preferBitrate: preferBitrate,
    );
  }

  String getCoverUrl({required String albumId, int? discId}) {
    if (discId == null) {
      return '$url/$albumId/cover';
    } else {
      return '$url/$albumId/$discId/cover';
    }
  }
}

String getAudioCachePath(String albumId, int discId, int trackId) {
  return p.join(Global.storageRoot, 'audio', albumId, "${discId}_$trackId");
}

class AnnilAudioSource extends ModifiedLockCachingAudioSource {
  final String albumId;
  final int discId;
  final int trackId;

  AnnilAudioSource._({
    required Uri uri,
    required this.albumId,
    required this.discId,
    required this.trackId,
    required MediaItem tag,
  }) : super(
          uri,
          cacheFile: File(getAudioCachePath(albumId, discId, trackId)),
          tag: tag,
        );

  static Future<IndexedAudioSource> create({
    required OnlineAnnilClient annil,
    required String albumId,
    required int discId,
    required int trackId,
    required PreferQuality preferBitrate,
  }) async {
    var track = await Global.metadataSource!
        .getTrack(albumId: albumId, discId: discId, trackId: trackId);
    return AnnilAudioSource._(
      uri: Uri.parse(
        '${annil.url}/$albumId/$discId/$trackId?auth=${annil.token}&quality=${preferBitrate.toBitrateString()}',
      ),
      albumId: albumId,
      discId: discId,
      trackId: trackId,
      tag: MediaItem(
        id: '$albumId/$discId/$trackId',
        title: track?.title ?? "Unknown Title",
        album: track?.disc.album.title ?? "Unknown Album",
        artist: track?.artist,
        // TODO: use disc cover
        artUri: File(getCoverCachePath(albumId, null)).uri,
        displayDescription: track?.type.toText() ?? "normal",
        rating: Rating.newHeartRating(false),
      ),
    );
  }

  static Future<IndexedAudioSource> local({
    required String albumId,
    required int discId,
    required int trackId,
  }) async {
    var track = await Global.metadataSource!
        .getTrack(albumId: albumId, discId: discId, trackId: trackId);
    return AudioSource.uri(
      Uri.file(getAudioCachePath(albumId, discId, trackId)),
      tag: MediaItem(
        id: '$albumId/$discId/$trackId',
        title: track?.title ?? "Unknown Title",
        album: track?.disc.album.title ?? "Unknown Album",
        artist: track?.artist,
        // TODO: use disc cover
        artUri: File(getCoverCachePath(albumId, null)).uri,
        displayDescription: track?.type.toText() ?? "normal",
      ),
    );
  }

  TrackInfoWithAlbum toTrack() {
    MediaItem tag = this.tag;

    return TrackInfoWithAlbum(
      track: TrackIdentifier(
        albumId: this.albumId,
        discId: this.discId,
        trackId: this.trackId,
      ),
      title: tag.title,
      artist: tag.artist!,
      type: TrackTypeExtension.fromString(tag.displayDescription!),
    );
  }
}

enum PreferQuality {
  Low,
  Medium,
  High,
  Lossless,
}

extension PreferBitrateToString on PreferQuality {
  String toBitrateString() {
    switch (this) {
      case PreferQuality.Low:
        return "low";
      case PreferQuality.Medium:
        return "medium";
      case PreferQuality.High:
        return "high";
      case PreferQuality.Lossless:
        return "lossless";
    }
  }
}

class OfflineAnnilClient implements BaseAnnilClient {
  static OfflineAnnilClient _instance = OfflineAnnilClient._();
  static OfflineAnnilClient get instance => OfflineAnnilClient._instance;

  OfflineAnnilClient._();

  @override
  Future<List<String>> getAlbums() async {
    final root = p.join(Global.storageRoot, 'audio');
    return Directory(root)
        .list()
        .where((entry) {
          if (entry is! Directory) {
            return false;
          }
          // return true if music file exists (any file with no extension)
          return entry
              .listSync()
              .any((e) => e is File && !p.basename(e.path).contains('.'));
        })
        .map((entry) => p.basename(entry.path))
        .toList();
  }

  @override
  Future<AudioSource> getAudio({
    required String albumId,
    required int discId,
    required int trackId,
    required PreferQuality preferBitrate,
  }) async {
    final path = getAudioCachePath(albumId, discId, trackId);
    return AudioSource.uri(Uri.file(path));
  }

  @override
  String getCoverUrl({required String albumId, int? discId}) {
    // placeholder, would never be called
    throw UnimplementedError();
  }

  static String cacheKey(String albumId, {int? discId}) {
    return discId == null ? "$albumId" : "$albumId/$discId";
  }

  bool isAvailable({
    required String albumId,
    required int discId,
    required int trackId,
  }) {
    final path = getAudioCachePath(albumId, discId, trackId);
    return File(path).existsSync();
  }
}
