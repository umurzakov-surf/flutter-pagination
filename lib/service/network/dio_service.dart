import 'package:dio/dio.dart';
import 'package:flutter_pagination/service/network/dio_interceptor.dart';

const baseUrl = 'https://api.instantwebtools.net/';

class DioService {
  Dio getDio() {
    final _dio = Dio();
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(DioInterceptor());
    
    return _dio;
  }
}
