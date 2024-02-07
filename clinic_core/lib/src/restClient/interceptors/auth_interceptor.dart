import 'package:clinic_system_core/src/constants/local_storage_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;
    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);
    if (extra['DIO_AUTH_KEY'] == true) {
      final sharedPreferences = await SharedPreferences.getInstance();
      headers.addAll({
        authHeaderKey:
            "Bearer ${sharedPreferences.getString(LocalStorageConstants.accessToken) ?? ""}",
      });
    }
    handler.next(options);
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }
}
