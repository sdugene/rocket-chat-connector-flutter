import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/new/user_new.dart';

import '../../scenarios/data/new/user_new_data.dart';

void main() {
  group('userNewModel methods', () {
    test('toAndFromMapEmpty', () async {
      UserNew userNew =
          UserNewData.getById(1);

      Map<String, dynamic> userJson = userNew.toMap();

      expect(
          '{name: name, email: email@user.tld, password: anypassyouwant, username: uniqueusername}',
          userJson.toString());

      expect(UserNew.fromMap(userJson), userNew);
    });
  });
}
