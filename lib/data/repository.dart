import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import './interceptors/token_interceptor.dart';
import './models/result.dart';
import '../shared/localization/app_localization.dart';

class Repository {
  Dio _dio;
  final _baseUrl = 'http://api-ahmat.thismusic.com.tr/';
  final _apiUrl = 'api/';

  get baseUrl {
    return _baseUrl;
  }

  get apiUrl {
    return '$_baseUrl$_apiUrl';
  }

  Dio get dio {
    if (_dio == null) _initDio();
    return _dio;
  }

  Result<dynamic> getError(Response response, {DioError error}) {
    if (response?.data['error'] != null)
      return Result(ResultStatus.FAIL,
          error: error, errorMessage: response?.data['error']);
    else
      return Result(ResultStatus.FAIL, errorMessage: AppLocalization.someError);
  }

  void _initDio() {
    _dio = Dio();
    _dio.options.baseUrl = _baseUrl;
    _dio.transformer = FlutterTransformer();
    _dio.interceptors.add(TokenInterceptor());
    _dio.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, requestHeader: true));
  }
}
