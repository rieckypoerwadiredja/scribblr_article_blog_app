import 'package:flutter/material.dart';

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

class DropdownTypeMenuItem {
  final String name;
  final VoidCallback event;

  DropdownTypeMenuItem({
    required this.name,
    required this.event,
  });
}
