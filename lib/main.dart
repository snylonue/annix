// The original content is temporarily commented out to allow generating a self-contained demo - feel free to uncomment later.

// import 'package:annix/app.dart';
// import 'package:annix/i18n/strings.g.dart';
// import 'package:annix/providers.dart';
// import 'package:annix/services/path.dart';
// import 'package:f_logs/f_logs.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   FLog.getDefaultConfigurations().isDevelopmentDebuggingEnabled = true;
//
//   final container = ProviderContainer();
//   await PathService.init();
//   await Future.wait([
//     container.read(proxyProvider).start(),
//     container.read(audioServiceProvider.future),
//   ]);
//
//   LocaleSettings.useDeviceLocale();
//
//   FlutterError.onError = (final details) {
//     FLog.error(
//       text: 'Flutter error',
//       className: details.library,
//       exception: details.exception,
//       stacktrace: details.stack,
//     );
//
//     FlutterError.presentError(details);
//   };
//   PlatformDispatcher.instance.onError = (final error, final stack) {
//     FLog.error(text: 'Root isolate error', exception: error, stacktrace: stack);
//     return true;
//   };
//
//   try {
//     runApp(
//       UncontrolledProviderScope(
//         container: container,
//         child: const AnnixApp(),
//       ),
//     );
//   } catch (e) {
//     FLog.error(text: 'Uncaught exception', exception: e);
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:annix/src/rust/api/simple.dart';
import 'package:annix/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: Text(
              'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
        ),
      ),
    );
  }
}
