import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends Interceptor {
  static const _authorizationHeader = 'Authorization';

  @override
  Future onRequest(RequestOptions options) async {
    final token = (await SharedPreferences.getInstance()).getString('token');
    if (token?.isNotEmpty == true)
      options.headers.addAll({_authorizationHeader: 'Bearer $token'});
  }

  @override
  Future onResponse(Response response) async {
    if (response.statusCode == 401) {
      (await SharedPreferences.getInstance()).setString('token', null);
    }
    return super.onResponse(response);
  }
}
