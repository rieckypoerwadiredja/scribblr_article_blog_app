enum NotificationType {
  general,
  system,
}

extension NotificationTypeExtension on NotificationType {
  String get value {
    switch (this) {
      case NotificationType.general:
        return 'General';
      case NotificationType.system:
        return 'System';
      default:
        return '';
    }
  }
}
