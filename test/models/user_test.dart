import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_flutter_connector/models/user.dart';

import '../scenarios/data/user_data.dart';

void main() {
  group('userModel methods', () {
    test('toAndFromMapEmpty', () async {
      User user = UserData.getById("aobEdbYhXfu5hkeqG");
      Map<String, dynamic> userJson = user.toMap();

      expect(UserData.getMapById("aobEdbYhXfu5hkeqG"), userJson);
      expect(User.fromMap(userJson), user);
    });
  });
}
