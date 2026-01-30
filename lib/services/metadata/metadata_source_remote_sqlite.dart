import 'dart:io';

import 'package:annix/providers.dart';
import 'package:annix/services/anniv/anniv_model.dart';
import 'package:annix/services/metadata/metadata_source_sqlite.dart';
import 'package:annix/services/path.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;

class RemoteSqliteMetadataSource extends SqliteMetadataSource {
  final Ref ref;
  final String url;
  final client = Dio();

  RemoteSqliteMetadataSource(this.ref, this.url)
      : super(p.join(PathService.dataRoot, 'remote'));

  @override
  Future<void> prepare() async {
    final dbPath = p.join(dbFolderPath, 'repo.db');
    if (!await File(dbPath).exists()) {
      await Directory(dbFolderPath).create(recursive: true);
      await client.download(p.join(url, 'repo.db'), dbPath);
      await client.download(
          p.join(url, 'repo.json'), p.join(dbFolderPath, 'repo.json'));
    }

    await super.prepare();
  }

  @override
  Future<bool> canUpdate() async {
    try {
      final repoDescription =
          (await client.get<RepoDatabaseDescription>(p.join(url, 'repo.json')))
              .data;
      final remoteLastModified = repoDescription!.lastModified;
      final localRepoDescription = await getDescription();
      final localLastModified = localRepoDescription.lastModified;
      return remoteLastModified > localLastModified;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> doUpdate() async {
    try {
      await client.download(
          p.join(url, 'repo.db'), p.join(dbFolderPath, 'repo.db'));
      await client.download(
          p.join(url, 'repo.json'), p.join(dbFolderPath, 'repo.json'));
      return true;
    } catch (e) {
      return false;
    }
  }
}
