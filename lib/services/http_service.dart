import 'package:http/http.dart';
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_with_middleware.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';

class HttpService {
  String _apiUrl;
  dynamic _httpClient;

  static Authentication authentication;

  HttpService(String apiUrl) {
    _apiUrl = apiUrl;
    _httpClient = _getHttpClient();
  }

  Future<Response> get(String uri) async =>
      await _httpClient.get(_apiUrl + uri, headers: await _getHeaders());

  Future<Response> post(String uri, String body) async => await _httpClient
      .post(_apiUrl + uri, headers: await _getHeaders(), body: body);

  Future<Response> put(String uri, String body) async => await _httpClient
      .put(_apiUrl + uri, headers: await _getHeaders(), body: body);

  Future<Response> delete(String uri) async =>
      await _httpClient.delete(_apiUrl + uri, headers: await _getHeaders());

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };

    if (authentication?.status == "success") {
      header['X-Auth-Token'] = authentication.data.authToken;
      header['X-User-Id'] = authentication.data.userId;
    }

    return header;
  }
}

HttpWithMiddleware _getHttpClient() {
  return HttpWithMiddleware.build(
    requestTimeout: Duration(minutes: 3),
    middlewares: [HttpLogger(logLevel: LogLevel.BODY)],
  );
}
