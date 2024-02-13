import 'package:asyncstate/asyncstate.dart';
import 'package:clinic_self_service/src/services/user_login_service.dart';
import 'package:clinic_system_core/clinic_system_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  final UserLoginService _userLoginService;

  LoginController({required UserLoginService userLoginService})
      : _userLoginService = userLoginService;

  final _obscurePassword = signal(true);
  final _logged = signal(false);

  bool get obscurePassword => _obscurePassword();
  bool get logged => _logged();

  void toggleObscurePassword() => _obscurePassword.value = !_obscurePassword();

  Future<void> login(String email, String password) async {
    final result =
        await _userLoginService.execute(email, password).asyncLoader();

    switch (result) {
      case Left(value: ServiceExcepetion(:final message)):
        showError(message);
        break;
      case Right(value: _):
        _logged.value = true;
        break;
    }
  }
}
