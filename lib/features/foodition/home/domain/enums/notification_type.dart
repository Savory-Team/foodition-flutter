import 'package:flutter/material.dart';

import '../../../../../core/assets/assets.dart';

enum NotificationType {
  transaction('Transaksi'),
  promotion('Promosi'),
  information('Info'),
  none('Not Found');

  const NotificationType(this.value);
  final String value;

  bool get isTransaction => this == NotificationType.transaction;
  bool get isPromotion => this == NotificationType.promotion;
  bool get isInformation => this == NotificationType.information;

  factory NotificationType.fromValue(String value) {
    return values.firstWhere(
      (item) => item.value == value,
      orElse: () => NotificationType.none,
    );
  }

  Widget get icon {
    switch (this) {
      case NotificationType.transaction:
        return Assets.icons.history.svg();
      case NotificationType.promotion:
        return Assets.icons.promotion.svg();
      case NotificationType.information:
        return Assets.icons.information.svg();
      default:
        return Assets.icons.information.svg();
    }
  }
}
