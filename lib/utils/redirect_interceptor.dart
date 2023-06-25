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
    FLog.error(text: response.toString());
    FLog.error(text: response.headers.toString());
    if (headers == null &&
        response.isRedirect) {
      headers = response.headers;
    } else if (headers != null) {
      response.headers = headers!;
      headers = null;
    }

    handler.next(response);
  }
}
