import 'dart:async';
import 'dart:io';

import 'package:annix/services/download/download_manager.dart';
import 'package:annix/services/font.dart';
import 'package:annix/services/network/proxy.dart';
import 'package:annix/services/settings.dart';
import 'package:annix/services/theme.dart';
import 'package:annix/utils/anni_weslide_controller.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Global {
  static late SharedPreferences preferences;

  static final settings = SettingsController();

  static bool isDesktop =
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;
  static bool isApple = Platform.isMacOS || Platform.isIOS;

  static late String storageRoot;
  static late String dataRoot;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static BuildContext get context => navigatorKey.currentContext!;

  static final mobileWeSlideController = AnniWeSlideController(initial: false);
  static final mobileWeSlideFooterController =
      AnniWeSlideController(initial: true);

  static AnnixProxy proxy = AnnixProxy();

  static final DownloadManager downloadManager = DownloadManager();

  static final AnnixTheme theme = AnnixTheme();

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    await proxy.start();
    settings.init();

    await FontService.load(settings.fontPath.value);

    if (isDesktop) {
      doWhenWindowReady(() {
        const initialSize = Size(1280, 800);
        appWindow.minSize = initialSize;
        appWindow.alignment = Alignment.center;
        appWindow.show();
      });

      final isPortableMode = File(p.normalize(
              p.join(Platform.resolvedExecutable, '..', 'portable.enable')))
          .existsSync();

      if (Platform.isMacOS) {
        storageRoot = p.join((await getLibraryDirectory()).path, 'data');
        dataRoot = storageRoot;
      } else {
        if (isPortableMode) {
          dataRoot =
              p.normalize(p.join(Platform.resolvedExecutable, '..', 'data'));
        } else {
          dataRoot = (await getApplicationSupportDirectory()).path;
        }
        storageRoot = p.join(dataRoot, 'cache');
      }
    } else {
      // save data in getApplicationDocumentsDirectory() on mobile
      dataRoot = (await getApplicationDocumentsDirectory()).path;
      if (Platform.isIOS) {
        storageRoot = (await getLibraryDirectory()).path;
      } else {
        storageRoot = (await getExternalStorageDirectory())!.path;
      }
    }
  }
}
