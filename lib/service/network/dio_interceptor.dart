import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // var response = _cache[options.uri];
    // if (options.extra['refresh'] == true) {
    //   print('${options.uri}: force refresh, ignore cache! \n');
    //   return handler.next(options);
    // } else if (response != null) {
    //   print('cache hit: ${options.uri} \n');
    //   return handler.resolve(response);
    // }
    // ignore: avoid_print
    print('options: $options');
    // ignore: avoid_print
    print('handler: $handler');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // _cache[response.requestOptions.uri] = response;
    // ignore: avoid_print
    print('response: $response');
    // ignore: avoid_print
    print('handler: $handler');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // print('onError: $err');
    // ignore: avoid_print
    print('error: $err');
    // ignore: avoid_print
    print('handler: $handler');
    super.onError(err, handler);
  }

  // final _cache = <Uri, Response>{};
}