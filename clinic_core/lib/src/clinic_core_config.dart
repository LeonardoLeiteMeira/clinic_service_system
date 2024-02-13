import 'package:asyncstate/asyncstate.dart';
import 'package:clinic_system_core/src/loader/clinic_loader.dart';
import 'package:clinic_system_core/src/theme/clinic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicCoreConfig extends StatelessWidget {
  const ClinicCoreConfig(
      {required this.title,
      this.bindings,
      this.pages,
      this.pageBuilder,
      this.modules,
      super.key});

  final String title;

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pageBuilder;
  final List<FlutterGetItModule>? modules;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: bindings,
      pages: [...pages ?? [], ...pageBuilder ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
            loader: ClinicLoader(),
            builder: (navigatorOBserver) {
              return MaterialApp(
                theme: ClinicTheme.lightTheme,
                title: title,
                navigatorObservers: [
                  flutterGetItNavObserver,
                  navigatorOBserver
                ],
                routes: routes,
              );
            });
      },
    );
  }
}
