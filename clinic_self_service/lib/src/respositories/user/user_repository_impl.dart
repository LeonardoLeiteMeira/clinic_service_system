import 'dart:developer';
import 'dart:io';

import 'package:clinic_self_service/src/respositories/user/user_repository.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  login(String email, String password) async {
    try {
      var response = await restClient.unAuth.post("/auth",
          data: {"email": email, "password": password, "admin": true});

      final Response(data: {"access_token": accessToken}) = response;
      return Right(accessToken);
    } on DioException catch (e, s) {
      log("Error to login", error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) =>
          Left(AuthUnauthorized()),
        (_) => Left(AuthError(message: "Erro ao fazer login. Tente novamente."))
      };
    }
  }
}
