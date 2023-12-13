import 'package:annix/providers.dart';
import 'package:annix/services/annil/annil.dart';
import 'package:annix/services/font.dart';
import 'package:annix/services/metadata/metadata_source_sqlite.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SearchTrackDisplayType {
  /// Display track artist.
  artist,

  /// Display album title.
  albumTitle,

  /// Display track artist and album title.
  artistAndAlbumTitle;

  bool get isThreeLine => this == artistAndAlbumTitle;

  bool get showArtist => this == artist || this == artistAndAlbumTitle;

  bool get showAlbumTitle => this == albumTitle || this == artistAndAlbumTitle;
}

class SettingsService {
  final Ref ref;

  SettingsService(this.ref) {
    final preferences = ref.read(preferencesProvider);

    useMobileNetwork =
        ValueNotifier(preferences.getBool('annix_use_mobile_network') ?? true);
    useMobileNetwork.addListener(
        saveChangedVariable('annix_use_mobile_network', useMobileNetwork));

    skipCertificateVerification = ValueNotifier(
        preferences.getBool('annix_skip_certificate_verification') ?? false);
    skipCertificateVerification.addListener(saveChangedVariable(
        'annix_skip_certificate_verification', skipCertificateVerification));

    autoScaleUI =
        ValueNotifier(preferences.getBool('annix_auto_scale_ui') ?? false);
    autoScaleUI
        .addListener(saveChangedVariable('annix_auto_scale_ui', autoScaleUI));

    mobileShowArtistInBottomPlayer = ValueNotifier(
        preferences.getBool('annix_mobile_show_artist_in_bottom_player') ??
            false);
    mobileShowArtistInBottomPlayer.addListener(saveChangedVariable(
        'annix_mobile_show_artist_in_bottom_player',
        mobileShowArtistInBottomPlayer));

    defaultAudioQuality = ValueNotifier(PreferQuality.values[
        preferences.getInt('annix_default_audio_quality') ??
            PreferQuality.medium.index]);
    defaultAudioQuality.addListener(saveChangedVariable(
        'annix_default_audio_quality', defaultAudioQuality));

    fontPath = ValueNotifier(preferences.getString('annix_font_path'));
    fontPath.addListener(() async {
      await saveChangedVariable('annix_font_path', fontPath)();
      await FontService.load(fontPath.value);
      ref.read(themeProvider).updateFontFamily();
    });

    blurPlayingPage = ValueNotifier(
        preferences.getBool('annix_enable_blur_playing_page') ?? false);
    blurPlayingPage.addListener(
        saveChangedVariable('annix_enable_blur_playing_page', blurPlayingPage));

    searchTrackDisplayType = ValueNotifier(SearchTrackDisplayType.values[
        preferences.getInt('annix_search_track_display_type') ??
            SearchTrackDisplayType.artist.index]);
    searchTrackDisplayType.addListener(saveChangedVariable(
        'annix_search_track_display_type', searchTrackDisplayType));

    experimentalOpus =
        ValueNotifier(preferences.getBool('annix_experimental_opus') ?? false);
    experimentalOpus.addListener(
        saveChangedVariable('annix_experimental_opus', experimentalOpus));

    dbPath = ValueNotifier(preferences.getString('annix_db_path'));
    dbPath.addListener(() async {
      await saveChangedVariable('annix_db_path', dbPath)();
      final metadata = ref.read(metadataProvider);
      if (dbPath.value != null) {
        metadata.sources.removeWhere((element) => element is SingleSqliteMetadataSource);
        final db = SingleSqliteMetadataSource(dbPath.value!);
        await db.prepare();
        metadata.sources.insert(0, db);
      }
    });
    dbPath.notifyListeners();
  }

  /// Download audio files using mobile network
  ///
  /// Default: true
  late ValueNotifier<bool> useMobileNetwork;

  /// Whether to skip certification check
  ///
  /// Default value: false
  late ValueNotifier<bool> skipCertificateVerification;

  /// Whether to enable auto scalable UI
  ///
  /// Default value: false
  late ValueNotifier<bool> autoScaleUI;

  /// [Mobile] Whether to display track artist in bottom player
  ///
  /// Default value: false
  late ValueNotifier<bool> mobileShowArtistInBottomPlayer;

  /// Default audio quality
  ///
  /// Default value: Medium
  late ValueNotifier<PreferQuality> defaultAudioQuality;

  /// Custom font path
  ///
  /// Default value: null
  late ValueNotifier<String?> fontPath;

  /// Blur playing page on mobile
  ///
  /// Default value: null
  late ValueNotifier<bool> blurPlayingPage;

  /// Control what to display in search result
  ///
  /// Default value: SearchTrackDisplayType.artist
  late ValueNotifier<SearchTrackDisplayType> searchTrackDisplayType;

  late ValueNotifier<bool> experimentalOpus;

  late ValueNotifier<String?> dbPath;

  Future<void> Function() saveChangedVariable<T>(
    final String key,
    final ValueNotifier<T> notifier,
  ) {
    return () async {
      final preferences = ref.read(preferencesProvider);

      final value = notifier.value;
      if (value is String || value is bool || value is int || value is double) {
        preferences.set(key, value);
      } else if (value is Enum) {
        preferences.set(key, value.index);
      } else if (value == null) {
        preferences.remove(key);
      } else {
        throw Exception('Unsupported type');
      }
    };
  }
}
