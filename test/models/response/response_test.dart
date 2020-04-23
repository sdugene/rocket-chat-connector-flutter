import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/response/response.dart';

import '../../scenarios/data/response/response_data.dart';

void main() {
  group('responseModel methods', () {
    test('toAndFromMapEmpty', () async {
      Response response = ResponseData.getById(1);
      Map<String, dynamic> responseJson = response.toMap();

      expect(ResponseData.getMapById(1), responseJson);
      expect(Response.fromMap(responseJson), response);
    });
  });
}
