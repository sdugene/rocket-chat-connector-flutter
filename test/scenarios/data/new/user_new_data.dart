import 'package:rocket_chat_connector_flutter/models/new/user_new.dart';

class UserNewData {
  static final Map<int, Map<String, dynamic>> userNewList = {
    1: {
      "name": "name",
      "email": "email@user.tld",
      "password": "anypassyouwant",
      "username": "uniqueusername"
    }
  };

  static Map<String, dynamic>? getMapById(int userNewId) {
    return UserNewData.userNewList[userNewId];
  }

  static UserNew getById(int userId) {
    return UserNew.fromMap(UserNewData.userNewList[userId]);
  }

  static List<UserNew> getUserNewList() {
    return UserNewData.userNewList.values
        .map((e) => UserNew.fromMap(e))
        .toList();
  }
}
