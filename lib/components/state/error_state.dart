import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../spaces.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRefresh;

  const ErrorState({
    super.key,
    this.message =
        'Maaf, sepertinya koneksi Anda terputus atau ada masalah dengan server',
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: context.deviceWidth,
      padding: const EdgeInsets.all(AppDimens.spacing24pt),
      decoration: const BoxDecoration(borderRadius: AppBorderRadius.radius12pt),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.refresh.svg(width: AppDimens.spacing32pt),
          const SpaceHeight(AppDimens.spacing16pt),
          SizedBox(
            width: 280.0,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          TextButton(
            onPressed: onRefresh,
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.radius12pt,
                side: BorderSide(color: Colors.grey.shade600),
              ),
              foregroundColor: Colors.grey.shade600,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.spacing16pt,
                vertical: AppDimens.spacing8pt,
              ),
            ),
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }
}
