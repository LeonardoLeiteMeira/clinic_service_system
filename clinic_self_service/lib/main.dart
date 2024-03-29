import 'dart:async';
import 'dart:developer';

import 'package:clinic_self_service/src/binding/clinic_app_binding.dart';
import 'package:clinic_self_service/src/modules/auth/auth_module.dart';
import 'package:clinic_self_service/src/modules/home/home_module.dart';
import 'package:clinic_self_service/src/modules/self_service/self_service_module.dart';
import 'package:clinic_self_service/src/pages/splash_page/splash_page.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() {
    runApp(const ClinicSelfServiceApp());
  }, (error, stack) {
    log('Error nao tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class ClinicSelfServiceApp extends StatelessWidget {
  const ClinicSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicCoreConfig(
      title: "Auto Atendimento",
      bindings: ClinicAppBinding(),
      modules: [
        AuthModule(),
        HomeModule(),
        SelfServiceModule(),
      ],
      pageBuilder: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: "/")
      ],
    );
  }
}
