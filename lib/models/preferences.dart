class Preferences {
  bool? enableAutoAway;
  int? idleTimeoutLimit;
  int? desktopNotificationDuration;
  String? audioNotifications;
  String? desktopNotifications;
  String? mobileNotifications;
  bool? unreadAlert;
  bool? useEmojis;
  bool? convertAsciiEmoji;
  bool? autoImageLoad;
  bool? saveMobileBandwidth;
  bool? collapseMediaByDefault;
  bool? hideUsernames;
  bool? hideRoles;
  bool? hideFlexTab;
  bool? hideAvatars;
  String? roomsListExhibitionMode;
  String? sidebarViewMode;
  bool? sidebarHideAvatar;
  bool? sidebarShowUnread;
  bool? sidebarShowFavorites;
  String? sendOnEnter;
  int? messageViewMode;
  String? emailNotificationMode;
  bool? roomCounterSidebar;
  String? newRoomNotification;
  String? newMessageNotification;
  bool? muteFocusedConversations;
  int? notificationsSoundVolume;

  Preferences({
    this.enableAutoAway,
    this.idleTimeoutLimit,
    this.desktopNotificationDuration,
    this.audioNotifications,
    this.desktopNotifications,
    this.mobileNotifications,
    this.unreadAlert,
    this.useEmojis,
    this.convertAsciiEmoji,
    this.autoImageLoad,
    this.saveMobileBandwidth,
    this.collapseMediaByDefault,
    this.hideUsernames,
    this.hideRoles,
    this.hideFlexTab,
    this.hideAvatars,
    this.roomsListExhibitionMode,
    this.sidebarViewMode,
    this.sidebarHideAvatar,
    this.sidebarShowUnread,
    this.sidebarShowFavorites,
    this.sendOnEnter,
    this.messageViewMode,
    this.emailNotificationMode,
    this.roomCounterSidebar,
    this.newRoomNotification,
    this.newMessageNotification,
    this.muteFocusedConversations,
    this.notificationsSoundVolume,
  });

  Preferences.fromMap(Map<dynamic, dynamic>? json) {
    if (json != null) {
      enableAutoAway = json['enableAutoAway'];
      idleTimeoutLimit = json['idleTimeoutLimit'];
      desktopNotificationDuration = json['desktopNotificationDuration'];
      audioNotifications = json['audioNotifications'];
      desktopNotifications = json['desktopNotifications'];
      mobileNotifications = json['mobileNotifications'];
      unreadAlert = json['unreadAlert'];
      useEmojis = json['useEmojis'];
      convertAsciiEmoji = json['convertAsciiEmoji'];
      autoImageLoad = json['autoImageLoad'];
      saveMobileBandwidth = json['saveMobileBandwidth'];
      collapseMediaByDefault = json['collapseMediaByDefault'];
      hideUsernames = json['hideUsernames'];
      hideRoles = json['hideRoles'];
      hideFlexTab = json['hideFlexTab'];
      hideAvatars = json['hideAvatars'];
      roomsListExhibitionMode = json['roomsListExhibitionMode'];
      sidebarViewMode = json['sidebarViewMode'];
      sidebarHideAvatar = json['sidebarHideAvatar'];
      sidebarShowUnread = json['sidebarShowUnread'];
      sidebarShowFavorites = json['sidebarShowFavorites'];
      sendOnEnter = json['sendOnEnter'];
      messageViewMode = json['messageViewMode'];
      emailNotificationMode = json['emailNotificationMode'];
      roomCounterSidebar = json['roomCounterSidebar'];
      newRoomNotification = json['newRoomNotification'];
      newMessageNotification = json['newMessageNotification'];
      muteFocusedConversations = json['muteFocusedConversations'];
      notificationsSoundVolume = json['notificationsSoundVolume'];
    }
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    if (enableAutoAway != null) {
      map['enableAutoAway'] = enableAutoAway;
    }
    if (idleTimeoutLimit != null) {
      map['idleTimeoutLimit'] = idleTimeoutLimit;
    }
    if (desktopNotificationDuration != null) {
      map['desktopNotificationDuration'] = desktopNotificationDuration;
    }
    if (audioNotifications != null) {
      map['audioNotifications'] = audioNotifications;
    }
    if (desktopNotifications != null) {
      map['desktopNotifications'] = desktopNotifications;
    }
    if (mobileNotifications != null) {
      map['mobileNotifications'] = mobileNotifications;
    }
    if (unreadAlert != null) {
      map['unreadAlert'] = unreadAlert;
    }
    if (useEmojis != null) {
      map['useEmojis'] = useEmojis;
    }
    if (convertAsciiEmoji != null) {
      map['convertAsciiEmoji'] = convertAsciiEmoji;
    }
    if (autoImageLoad != null) {
      map['autoImageLoad'] = autoImageLoad;
    }
    if (saveMobileBandwidth != null) {
      map['saveMobileBandwidth'] = saveMobileBandwidth;
    }
    if (collapseMediaByDefault != null) {
      map['collapseMediaByDefault'] = collapseMediaByDefault;
    }
    if (hideUsernames != null) {
      map['hideUsernames'] = hideUsernames;
    }
    if (hideRoles != null) {
      map['hideRoles'] = hideRoles;
    }
    if (hideFlexTab != null) {
      map['hideFlexTab'] = hideFlexTab;
    }
    if (hideAvatars != null) {
      map['hideAvatars'] = hideAvatars;
    }
    if (roomsListExhibitionMode != null) {
      map['roomsListExhibitionMode'] = roomsListExhibitionMode;
    }
    if (sidebarViewMode != null) {
      map['sidebarViewMode'] = sidebarViewMode;
    }
    if (sidebarHideAvatar != null) {
      map['sidebarHideAvatar'] = sidebarHideAvatar;
    }
    if (sidebarShowUnread != null) {
      map['sidebarShowUnread'] = sidebarShowUnread;
    }
    if (sidebarShowFavorites != null) {
      map['sidebarShowFavorites'] = sidebarShowFavorites;
    }
    if (sendOnEnter != null) {
      map['sendOnEnter'] = sendOnEnter;
    }
    if (messageViewMode != null) {
      map['messageViewMode'] = messageViewMode;
    }
    if (emailNotificationMode != null) {
      map['emailNotificationMode'] = emailNotificationMode;
    }
    if (roomCounterSidebar != null) {
      map['roomCounterSidebar'] = roomCounterSidebar;
    }
    if (newRoomNotification != null) {
      map['newRoomNotification'] = newRoomNotification;
    }
    if (newMessageNotification != null) {
      map['newMessageNotification'] = newMessageNotification;
    }
    if (muteFocusedConversations != null) {
      map['muteFocusedConversations'] = muteFocusedConversations;
    }
    if (notificationsSoundVolume != null) {
      map['notificationsSoundVolume'] = notificationsSoundVolume;
    }

    return map;
  }

  @override
  String toString() {
    return 'Preferences{enableAutoAway: $enableAutoAway, idleTimeoutLimit: $idleTimeoutLimit, desktopNotificationDuration: $desktopNotificationDuration, audioNotifications: $audioNotifications, desktopNotifications: $desktopNotifications, mobileNotifications: $mobileNotifications, unreadAlert: $unreadAlert, useEmojis: $useEmojis, convertAsciiEmoji: $convertAsciiEmoji, autoImageLoad: $autoImageLoad, saveMobileBandwidth: $saveMobileBandwidth, collapseMediaByDefault: $collapseMediaByDefault, hideUsernames: $hideUsernames, hideRoles: $hideRoles, hideFlexTab: $hideFlexTab, hideAvatars: $hideAvatars, roomsListExhibitionMode: $roomsListExhibitionMode, sidebarViewMode: $sidebarViewMode, sidebarHideAvatar: $sidebarHideAvatar, sidebarShowUnread: $sidebarShowUnread, sidebarShowFavorites: $sidebarShowFavorites, sendOnEnter: $sendOnEnter, messageViewMode: $messageViewMode, emailNotificationMode: $emailNotificationMode, roomCounterSidebar: $roomCounterSidebar, newRoomNotification: $newRoomNotification, newMessageNotification: $newMessageNotification, muteFocusedConversations: $muteFocusedConversations, notificationsSoundVolume: $notificationsSoundVolume}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Preferences &&
          runtimeType == other.runtimeType &&
          enableAutoAway == other.enableAutoAway &&
          idleTimeoutLimit == other.idleTimeoutLimit &&
          desktopNotificationDuration == other.desktopNotificationDuration &&
          audioNotifications == other.audioNotifications &&
          desktopNotifications == other.desktopNotifications &&
          mobileNotifications == other.mobileNotifications &&
          unreadAlert == other.unreadAlert &&
          useEmojis == other.useEmojis &&
          convertAsciiEmoji == other.convertAsciiEmoji &&
          autoImageLoad == other.autoImageLoad &&
          saveMobileBandwidth == other.saveMobileBandwidth &&
          collapseMediaByDefault == other.collapseMediaByDefault &&
          hideUsernames == other.hideUsernames &&
          hideRoles == other.hideRoles &&
          hideFlexTab == other.hideFlexTab &&
          hideAvatars == other.hideAvatars &&
          roomsListExhibitionMode == other.roomsListExhibitionMode &&
          sidebarViewMode == other.sidebarViewMode &&
          sidebarHideAvatar == other.sidebarHideAvatar &&
          sidebarShowUnread == other.sidebarShowUnread &&
          sidebarShowFavorites == other.sidebarShowFavorites &&
          sendOnEnter == other.sendOnEnter &&
          messageViewMode == other.messageViewMode &&
          emailNotificationMode == other.emailNotificationMode &&
          roomCounterSidebar == other.roomCounterSidebar &&
          newRoomNotification == other.newRoomNotification &&
          newMessageNotification == other.newMessageNotification &&
          muteFocusedConversations == other.muteFocusedConversations &&
          notificationsSoundVolume == other.notificationsSoundVolume;

  @override
  int get hashCode =>
      enableAutoAway.hashCode ^
      idleTimeoutLimit.hashCode ^
      desktopNotificationDuration.hashCode ^
      audioNotifications.hashCode ^
      desktopNotifications.hashCode ^
      mobileNotifications.hashCode ^
      unreadAlert.hashCode ^
      useEmojis.hashCode ^
      convertAsciiEmoji.hashCode ^
      autoImageLoad.hashCode ^
      saveMobileBandwidth.hashCode ^
      collapseMediaByDefault.hashCode ^
      hideUsernames.hashCode ^
      hideRoles.hashCode ^
      hideFlexTab.hashCode ^
      hideAvatars.hashCode ^
      roomsListExhibitionMode.hashCode ^
      sidebarViewMode.hashCode ^
      sidebarHideAvatar.hashCode ^
      sidebarShowUnread.hashCode ^
      sidebarShowFavorites.hashCode ^
      sendOnEnter.hashCode ^
      messageViewMode.hashCode ^
      emailNotificationMode.hashCode ^
      roomCounterSidebar.hashCode ^
      newRoomNotification.hashCode ^
      newMessageNotification.hashCode ^
      muteFocusedConversations.hashCode ^
      notificationsSoundVolume.hashCode;
}
