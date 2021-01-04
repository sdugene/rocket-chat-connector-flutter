import 'package:http/http.dart' as http;
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/filters/filter.dart';

class HttpService {
  String _apiUrl;

  HttpService(String apiUrl) {
    _apiUrl = apiUrl;
  }

  Future<http.Response> getWithFilter(
          String uri, Filter filter, Authentication authentication) async =>
      await http.get(_apiUrl + uri + '?' + _urlEncode(filter.toMap()),
          headers: await _getHeaders(authentication));

  Future<http.Response> get(String uri, Authentication authentication) async =>
      await http.get(_apiUrl + uri, headers: await _getHeaders(authentication));

  Future<http.Response> post(
          String uri, String body, Authentication authentication) async =>
      await http.post(_apiUrl + uri,
          headers: await _getHeaders(authentication), body: body);

  Future<http.Response> put(
          String uri, String body, Authentication authentication) async =>
      await http.put(_apiUrl + uri,
          headers: await _getHeaders(authentication), body: body);

  Future<http.Response> delete(
          String uri, Authentication authentication) async =>
      await http.delete(_apiUrl + uri,
          headers: await _getHeaders(authentication));

  Future<Map<String, String>> _getHeaders(Authentication authentication) async {
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

String _urlEncode(Map object) {
  int index = 0;
  String url = object.keys.map((key) {
    if (object[key]?.toString()?.isNotEmpty == true) {
      String value = "";
      if (index != 0) {
        value = "&";
      }
      index++;
      return "$value${Uri.encodeComponent(key)}=${Uri.encodeComponent(object[key].toString())}";
    }
    return "";
  }).join();
  return url;
}
