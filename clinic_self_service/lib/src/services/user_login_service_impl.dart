import 'package:clinic_self_service/src/respositories/user/user_repository.dart';
import 'package:clinic_self_service/src/services/user_login_service.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  UserLoginServiceImpl({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<ServiceExcepetion, Unit>> execute(
      String email, String password) async {
    final loginResult = await userRepository.login(email, password);

    switch (loginResult) {
      case Left(value: AuthError(:var message)):
        return Left(ServiceExcepetion(message: message));

      case Left(value: AuthUnauthorized()):
        return Left(ServiceExcepetion(
            message: "Credenciais inválidas. Tente novamente."));

      case Right(value: final accessToken):
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString(
            LocalStorageConstants.accessToken, accessToken);
        return Right(unit);
    }
  }
}
