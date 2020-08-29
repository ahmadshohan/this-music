import 'package:dio/dio.dart';

class Result<T> {
  Result(this.state, {this.data, this.errorMessage, this.error});

  final T data;

  final DioError error;
  final String errorMessage;
  final ResultStatus state;
}

enum ResultStatus { SUCCESS, FAIL, UNAUTHORIZED }
