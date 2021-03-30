import 'package:rocket_chat_connector_flutter/models/user.dart';

class UserData {
  static final Map<String, Map<String, dynamic>> userList = {
    "aobEdbYhXfu5hkeqG": {
      "_id": "aobEdbYhXfu5hkeqG",
      "name": "Example User",
      "emails": [
        {"address": "example@example.com", "verified": true}
      ],
      "status": "offline",
      "statusConnection": "offline",
      "username": "example",
      "utcOffset": 0,
      "active": true,
      "roles": ["user", "admin"],
      "settings": {
        "preferences": {
          "enableAutoAway": false,
          "idleTimeoutLimit": 300,
          "desktopNotificationDuration": 0,
          "audioNotifications": "mentions",
          "desktopNotifications": "mentions",
          "mobileNotifications": "mentions",
          "unreadAlert": true,
          "useEmojis": true,
          "convertAsciiEmoji": true,
          "autoImageLoad": true,
          "saveMobileBandwidth": true,
          "collapseMediaByDefault": false,
          "hideUsernames": false,
          "hideRoles": false,
          "hideFlexTab": false,
          "hideAvatars": false,
          "roomsListExhibitionMode": "category",
          "sidebarViewMode": "medium",
          "sidebarHideAvatar": false,
          "sidebarShowUnread": false,
          "sidebarShowFavorites": true,
          "sendOnEnter": "normal",
          "messageViewMode": 0,
          "emailNotificationMode": "all",
          "roomCounterSidebar": false,
          "newRoomNotification": "door",
          "newMessageNotification": "chime",
          "muteFocusedConversations": true,
          "notificationsSoundVolume": 100
        }
      },
      "customFields": {"twitter": "@userstwi"},
      "avatarUrl": "http://localhost:3000/avatar/test",
      "customFields": {"twitter": "@userstwi"},
      "success": true
    },
    "BsNr28znDkG8aeo7W": {
      "user": {
        "_id": "BsNr28znDkG8aeo7W",
        "createdAt": "2016-09-13T14:57:56.037Z",
        "services": {
          "password": {
            "bcrypt":
                "\$2a\$10\$5I5nUzqNEs8jKhi7BFS55uFYRf5TE4ErSUH8HymMNAbpMAvsOcl2C"
          }
        },
        "username": "uniqueusername",
        "emails": [
          {"address": "email@user.tld", "verified": false}
        ],
        "type": "user",
        "status": "offline",
        "active": true,
        "roles": ["user"],
        "_updatedAt": "2016-09-13T14:57:56.175Z",
        "name": "name",
        "settings": {}
      },
      "success": true
    }
  };

  static Map<String, dynamic>? getMapById(String userId) {
    return UserData.userList[userId];
  }

  static User getById(String userId) {
    return User.fromMap(UserData.userList[userId]);
  }

  static List<User> getUserList() {
    return UserData.userList.values.map((e) => User.fromMap(e)).toList();
  }
}
