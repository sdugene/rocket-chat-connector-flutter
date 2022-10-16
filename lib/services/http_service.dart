import 'package:http/http.dart' as http;
import 'package:rocket_chat_flutter_connector/models/authentication.dart';
import 'package:rocket_chat_flutter_connector/models/filters/filter.dart';

class HttpService {
  Uri? _apiUrl;

  HttpService(Uri apiUrl) {
    _apiUrl = apiUrl;
  }

  Future<http.Response> getWithFilter(
          String uri, Filter filter, Authentication authentication) async =>
      await http.get(
          Uri.parse(
              _apiUrl.toString() + uri + '?' + _urlEncode(filter.toMap())),
          headers: await (_getHeaders(authentication)
              as Future<Map<String, String>?>));

  Future<http.Response> get(String uri, Authentication authentication) async =>
      await http.get(Uri.parse(_apiUrl.toString() + uri),
          headers: await (_getHeaders(authentication)
              as Future<Map<String, String>?>));

  Future<http.Response> post(
          String uri, String body, Authentication? authentication) async =>
      await http.post(Uri.parse(_apiUrl.toString() + uri),
          headers: await (_getHeaders(authentication)
              as Future<Map<String, String>?>),
          body: body);

  Future<http.Response> put(
          String uri, String body, Authentication authentication) async =>
      await http.put(Uri.parse(_apiUrl.toString() + uri),
          headers: await (_getHeaders(authentication)
              as Future<Map<String, String>?>),
          body: body);

  Future<http.Response> delete(
          String uri, Authentication authentication) async =>
      await http.delete(Uri.parse(_apiUrl.toString() + uri),
          headers: await (_getHeaders(authentication)
              as Future<Map<String, String>?>));

  Future<Map<String, String?>> _getHeaders(
      Authentication? authentication) async {
    Map<String, String?> header = {
      'Content-type': 'application/json',
    };

    if (authentication?.status == "success") {
      header['X-Auth-Token'] = authentication!.data!.authToken;
      header['X-User-Id'] = authentication.data!.userId;
    }

    return header;
  }
}

String _urlEncode(Map object) {
  int index = 0;
  String url = object.keys.map((key) {
    if (object[key]?.toString().isNotEmpty == true) {
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
