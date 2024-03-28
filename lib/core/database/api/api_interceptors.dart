import 'package:clinic/core/database/api/end_points.dart';
import 'package:clinic/core/database/cache/cach_helper.dart';
import 'package:dio/dio.dart';

import '../../services/service_lcator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.accessToken] =
        sl<CacheHelper>().getData(key: ApiKeys.accessToken) != null
            ? '${sl<CacheHelper>().getData(key: ApiKeys.accessToken)}'
            : null;
        //     options.headers['token'] =
        // sl<CacheHelper>().getData(key: 'token') != null
        //     ? '${sl<CacheHelper>().getData(key: 'token')}'
        //     : null;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
