import 'package:clinic_self_service/src/modules/auth/login/login_router.dart';
import 'package:clinic_self_service/src/respositories/user/user_repository.dart';
import 'package:clinic_self_service/src/respositories/user/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
            (i) => UserRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => "/auth";

  @override
  Map<String, WidgetBuilder> get pages =>
      {"/login": (_) => const LoginRouter()};
}
