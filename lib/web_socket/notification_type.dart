enum NotificationType { CONNECTED, RESULT, UPDATED, CHANGED, PING, UNKNOWN }

NotificationType notificationTypeFromString(String? notificationType) {
  if (notificationType == 'connected') {
    return NotificationType.CONNECTED;
  } else if (notificationType == 'result') {
    return NotificationType.RESULT;
  } else if (notificationType == 'updated') {
    return NotificationType.UPDATED;
  } else if (notificationType == 'changed') {
    return NotificationType.CHANGED;
  } else if (notificationType == 'ping') {
    return NotificationType.PING;
  } else {
    return NotificationType.UNKNOWN;
  }
}
