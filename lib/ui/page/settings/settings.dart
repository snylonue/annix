import 'dart:io';

import 'package:annix/providers.dart';
import 'package:annix/services/annil/annil.dart';
import 'package:annix/services/path.dart';
import 'package:annix/services/settings.dart';
import 'package:annix/ui/dialogs/enum_select.dart';
import 'package:annix/ui/dialogs/loading.dart';
import 'package:annix/ui/dialogs/prefer_quality.dart';
import 'package:annix/ui/route/delegate.dart';
import 'package:annix/ui/widgets/maybe_appbar.dart';
import 'package:annix/utils/context_extension.dart';
import 'package:annix/services/local/cache.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:annix/i18n/strings.g.dart';
import 'package:file_picker/file_picker.dart';

typedef WidgetCallback = Widget Function();

class SettingsTileBuilder<T> extends AbstractSettingsTile {
  final Widget Function(BuildContext, T, Widget?) builder;
  final ValueNotifier<T> value;
  final Widget? child;

  const SettingsTileBuilder({
    required this.builder,
    required this.value,
    this.child,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: value,
      builder: builder,
      child: child,
    );
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final settings = ref.read(settingsProvider);

    return Scaffold(
      appBar: maybeAppBar(
        context,
        AppBar(
          title: Text(t.settings.settings),
          centerTitle: true,
        ),
      ),
      body: SettingsList(
        lightTheme: SettingsThemeData(
          settingsListBackground: context.colorScheme.background,
        ),
        darkTheme: SettingsThemeData(
          settingsListBackground: context.colorScheme.background,
        ),
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: [
              SettingsTileBuilder<bool>(
                value: settings.skipCertificateVerification,
                builder: (final context, final p, final child) =>
                    SettingsTile.switchTile(
                  onToggle: (final value) {
                    settings.skipCertificateVerification.value = value;
                  },
                  initialValue: p,
                  leading: const Icon(Icons.security_outlined),
                  title: Text(t.settings.skip_cert),
                ),
              ),
              SettingsTileBuilder<PreferQuality>(
                value: settings.defaultAudioQuality,
                builder: (final context, final p, final child) =>
                    SettingsTile.navigation(
                  onPressed: (final context) async {
                    final quality = await showPreferQualityDialog(context, ref);
                    settings.defaultAudioQuality.value = quality;
                  },
                  leading: const Icon(Icons.high_quality),
                  title: Text(t.settings.default_audio_quality),
                  description: Text(p.toString()),
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('UI'),
            tiles: [
              SettingsTileBuilder<bool>(
                value: settings.autoScaleUI,
                builder: (final context, final p, final _) =>
                    SettingsTile.switchTile(
                  onToggle: (final value) {
                    settings.autoScaleUI.value = value;
                    AnnixRouterDelegate.of(context).popRoute();
                  },
                  initialValue: p,
                  leading: const Icon(Icons.smart_screen_outlined),
                  title: Text(t.settings.auto_scale_ui),
                ),
              ),
              if (context.isMobileOrPortrait)
                SettingsTileBuilder<bool>(
                  value: settings.blurPlayingPage,
                  builder: (final context, final p, final _) =>
                      SettingsTile.switchTile(
                    onToggle: (final value) {
                      settings.blurPlayingPage.value = value;
                    },
                    initialValue: p,
                    leading: const Icon(Icons.blur_circular),
                    title: Text(t.settings.blur_playing_page),
                  ),
                ),
              SettingsTileBuilder<SearchTrackDisplayType>(
                value: settings.searchTrackDisplayType,
                builder: (final context, final p, final child) =>
                    SettingsTile.navigation(
                  onPressed: (final context) async {
                    final result = await showEnumSelectDialog(
                      context,
                      {
                        SearchTrackDisplayType.artist: const Text('Artist'),
                        SearchTrackDisplayType.albumTitle: const Text('Album'),
                        SearchTrackDisplayType.artistAndAlbumTitle:
                            const Text('Both'),
                      },
                      settings.searchTrackDisplayType.value,
                    );
                    settings.searchTrackDisplayType.value = result;
                  },
                  leading: const Icon(Icons.high_quality),
                  title: const Text('SearchTrackDisplayType'),
                  description: Text(p.toString()),
                ),
              ),
              SettingsTileBuilder<String?>(
                value: settings.fontPath,
                builder: (final context, final p, final _) =>
                    SettingsTile.navigation(
                  leading: const Icon(Icons.font_download),
                  title: Text(t.settings.custom_font_path),
                  description: Text(p ?? t.settings.custom_font_not_specified),
                  onPressed: (final context) async {
                    final result = await FilePicker.platform.pickFiles(
                      allowedExtensions: ['ttf', 'otf'],
                      type: FileType.custom,
                    );

                    if (result != null) {
                      settings.fontPath.value = result.files.single.path;
                    } else {
                      settings.fontPath.value = null;
                    }
                  },
                ),
              ),
              if (context.isMobileOrPortrait)
                SettingsTileBuilder<bool>(
                  value: settings.mobileShowArtistInBottomPlayer,
                  builder: (final context, final p, final _) =>
                      SettingsTile.switchTile(
                    onToggle: (final value) {
                      settings.mobileShowArtistInBottomPlayer.value = value;
                    },
                    initialValue: p,
                    leading: const Icon(Icons.person_outline),
                    title: Text(t.settings.show_artist_in_bottom_player),
                    description:
                        Text(t.settings.show_artist_in_bottom_player_desc),
                  ),
                ),
            ],
          ),
          SettingsSection(
            title: const Text('Playback'),
            tiles: [
              SettingsTileBuilder<bool>(
                value: settings.useMobileNetwork,
                builder: (final context, final p, final _) =>
                    SettingsTile.switchTile(
                  onToggle: (final value) {
                    settings.useMobileNetwork.value = value;
                  },
                  initialValue: p,
                  leading: const Icon(Icons.mobiledata_off_outlined),
                  title: Text(t.settings.use_mobile_network),
                ),
              ),
              SettingsTileBuilder<bool>(
                value: settings.experimentalOpus,
                builder: (final context, final p, final _) =>
                    SettingsTile.switchTile(
                  onToggle: (final value) {
                    settings.experimentalOpus.value = value;
                  },
                  initialValue: p,
                  leading: const Icon(Icons.transform_outlined),
                  title: const Text('Experimental: Opus support'),
                  description: const Text(
                    'Experimental feature flag to enable opus on supported Annil servers. Does not work on apple devices.',
                  ),
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Advanced'),
            tiles: <SettingsTile>[
              // view logs
              SettingsTile.navigation(
                leading: const Icon(Icons.report_outlined),
                title: Text(t.settings.view_logs),
                description: Text(t.settings.view_logs_desc),
                onPressed: (final context) {
                  AnnixRouterDelegate.of(context).to(name: '/settings/log');
                },
              ),
              // remove local database
              SettingsTile.navigation(
                leading: const Icon(Icons.data_array),
                title: Text(t.settings.clear_database),
                description: Text(t.settings.clear_database_desc),
                onPressed: (final context) {
                  final navigator = Navigator.of(context, rootNavigator: true);
                  showDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (final context) => SimpleDialog(
                      title: Text(t.progress),
                      children: const [
                        Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );

                  final file = File(localDbPath());
                  file.delete().then((final _) => navigator.pop());
                },
              ),
              // clear local metadata cache
              SettingsTile.navigation(
                leading: const Icon(Icons.featured_play_list_outlined),
                title: Text(t.settings.clear_metadata_cache),
                description: Text(t.settings.clear_metadata_cache_desc),
                onPressed: (final context) async {
                  final delegate = AnnixRouterDelegate.of(context);
                  showLoadingDialog(context);
                  await AnnixStore().clear('album');
                  delegate.popRoute();
                },
              ),
              // clear local lyric cache
              SettingsTile.navigation(
                leading: const Icon(Icons.lyrics_outlined),
                title: Text(t.settings.clear_lyric_cache),
                description: Text(t.settings.clear_lyric_cache_desc),
                onPressed: (final context) {
                  final navigator = Navigator.of(context, rootNavigator: true);
                  showDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (final context) => SimpleDialog(
                      title: Text(t.progress),
                      children: const [
                        Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );
                  AnnixStore()
                      .clear('lyric')
                      .then((final _) => navigator.pop());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
