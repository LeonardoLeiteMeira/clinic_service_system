sealed class AuthException implements Exception {
  final String message;

  AuthException({this.message = ''});
}

final class AuthError extends AuthException {
  AuthError({required super.message});
}

final class AuthUnauthorized extends AuthException {
  AuthUnauthorized();
}
