import 'package:clinic_system_core/clinic_system_core.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceExcepetion, Unit>> execute(
      String email, String password);
}
