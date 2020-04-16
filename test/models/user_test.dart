import 'package:flutter_test/flutter_test.dart';
import 'package:rocket_chat_connector_flutter/models/user.dart';
import '../scenarios/data/user_data.dart';

void main() {
  group('userModel methods', () {
    test('toAndFromMapEmpty', () async {
      User user =
          UserData.getById("aobEdbYhXfu5hkeqG");

      Map<String, dynamic> userJson = user.toMap();

      expect(
          '{'
              '_id: aobEdbYhXfu5hkeqG, '
              'name: Example User, '
              'emails: [{'
                'address: example@example.com, '
                'verified: true'
              '}], '
              'status: offline, '
              'statusConnection: offline, '
              'username: example, '
              'utcOffset: 0, '
              'active: true, '
              'roles: ['
                'user, '
                'admin'
              '], '
              'settings: {'
                'preferences: {'
                  'enableAutoAway: false, '
                  'idleTimeoutLimit: 300, '
                  'desktopNotificationDuration: 0, '
                  'audioNotifications: mentions, '
                  'desktopNotifications: mentions, '
                  'mobileNotifications: mentions, '
                  'unreadAlert: true, '
                  'useEmojis: true, '
                  'convertAsciiEmoji: true, '
                  'autoImageLoad: true, '
                  'saveMobileBandwidth: true, '
                  'collapseMediaByDefault: false, '
                  'hideUsernames: false, '
                  'hideRoles: false, '
                  'hideFlexTab: false, '
                  'hideAvatars: false, '
                  'roomsListExhibitionMode: category, '
                  'sidebarViewMode: medium, '
                  'sidebarHideAvatar: false, '
                  'sidebarShowUnread: false, '
                  'sidebarShowFavorites: true, '
                  'sendOnEnter: normal, '
                  'messageViewMode: 0, '
                  'emailNotificationMode: all, '
                  'roomCounterSidebar: false, '
                  'newRoomNotification: door, '
                  'newMessageNotification: chime, '
                  'muteFocusedConversations: true, '
                  'notificationsSoundVolume: 100'
                '}'
              '}, '
              'avatarUrl: http://localhost:3000/avatar/test, '
              'customFields: {twitter: @userstwi}, '
              'success: true'
            '}',
          userJson.toString());

      expect(User.fromMap(userJson), user);
    });
  });
}
