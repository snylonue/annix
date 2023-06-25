import 'package:dio/dio.dart';
import 'package:f_logs/f_logs.dart';

// Writes headers of a redirect to subsquent responses.
class RedirectInterceptor extends Interceptor {
  Headers? headers;

  @override
  void onResponse(
    final Response response,
    final ResponseInterceptorHandler handler,
  ) {
    FLog.error(text: '$response');
    if (headers == null &&
        response.statusCode! >= 300 &&
        response.statusCode! < 400) {
      headers = response.headers;
    } else if (headers != null) {
      response.headers = headers!;
      headers = null;
    }

    handler.next(response);
  }
}
