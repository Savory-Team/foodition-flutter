import '../../../../../core/core.dart';
import '../enums/enums.dart';

class NotificationModel {
  final NotificationType type;
  final String label;
  final String message;
  final DateTime date;

  NotificationModel({
    required this.type,
    required this.label,
    required this.message,
    required this.date,
  });

  String get dateFormat {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} detik yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} hari yang lalu';
    } else {
      return date.toFormattedDatetime();
    }
  }
}
