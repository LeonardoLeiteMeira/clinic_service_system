import 'package:clinic_self_service/src/binding/clinic_app_binding.dart';
import 'package:clinic_self_service/src/pages/splash_page/splash_page.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const ClinicSelfServiceApp());
}

class ClinicSelfServiceApp extends StatelessWidget {
  const ClinicSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClinicCoreConfig(
      title: "Auto Atendimento",
      bindings: ClinicAppBinding(),
      pageBuilder: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: "/")
      ],
    );
  }
}
