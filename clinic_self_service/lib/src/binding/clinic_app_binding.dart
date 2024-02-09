import 'package:clinic_self_service/src/core/env.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ClinicAppBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() {
    return [
      Bind.lazySingleton<RestClient>((i) => RestClient(Env.backendBaseUrl)),
    ];
  }
}
