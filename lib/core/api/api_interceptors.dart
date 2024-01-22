import 'package:dio/dio.dart';

import '../cache_helper/cache_helper.dart';
import '../services/service_locator.dart';
import 'endPoints/endPoint.dart';



class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
     sl<CacheHelper>().getData(key: ApiKeys.token)
    != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: ApiKeys.token)}'
        : null;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
