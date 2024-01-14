import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants/colors.dart';

extension BuildContextExt on BuildContext {
  /// [MediaQuery] Get access to device width
  double get deviceWidth => MediaQuery.of(this).size.width;

  /// [MediaQuery] Get access to device height
  double get deviceHeight => MediaQuery.of(this).size.height;

  /// Show a loading dialog with text [message]
  Future showLoadingDialog({String? message}) {
    return EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      status: message ?? 'Loading...',
      dismissOnTap: false,
    );
  }

  /// Dismiss current showed loading dialog
  Future dismissLoadingDialog() => EasyLoading.dismiss();

  /// Displays a snackbar with an error message.
  ///
  /// Example usage:
  /// ```dart
  /// context.showErrorMessage("This is an error message");
  /// ```
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Displays a snackbar with a success message.
  ///
  /// Example usage:
  /// ```dart
  /// context.showSuccessMessage("This is a success message");
  /// ```
  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
