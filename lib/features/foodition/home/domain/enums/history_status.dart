import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';

enum HistoryStatus {
  pending('pending'),
  deliver('deliver'),
  done('done'),
  canceled('canceled'),
  none('none');

  const HistoryStatus(this.status);
  final String status;

  bool get isPending => this == HistoryStatus.pending;
  bool get isDeliver => this == HistoryStatus.deliver;
  bool get isDone => this == HistoryStatus.done;
  bool get isCanceled => this == HistoryStatus.canceled;

  factory HistoryStatus.fromStatus(String status) {
    return values.firstWhere(
      (value) => value.status == status,
      orElse: () => HistoryStatus.none,
    );
  }

  String get label {
    switch (this) {
      case HistoryStatus.pending:
        return 'Menunggu Pengambilan';
      case HistoryStatus.deliver:
        return 'Dikirim';
      case HistoryStatus.done:
        return 'Selesai';
      case HistoryStatus.canceled:
        return 'Dibatalkan';
      default:
        return 'Unknow status';
    }
  }

  Color get color {
    switch (this) {
      case HistoryStatus.pending:
        return AppColors.hint;
      case HistoryStatus.deliver:
        return AppColors.yellow;
      case HistoryStatus.done:
        return AppColors.primary;
      case HistoryStatus.canceled:
        return AppColors.red;
      default:
        return AppColors.black;
    }
  }
}
