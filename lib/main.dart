import 'package:finanza_personale/app/app.dart';
import 'package:finanza_personale/provider/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  WindowOptions windowOptions = const WindowOptions(
    //Pixel 7a form factor (2400x1080 px)
    size: Size(376, 835),
  );

  if (UniversalPlatform.isDesktop) {
    await windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
