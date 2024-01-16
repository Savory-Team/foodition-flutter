import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../components.dart';

class EmptyState extends StatelessWidget {
  final String message;
  const EmptyState({super.key, this.message = 'Data tidak ditemukan'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Assets.images.empty.image(height: 150.0),
          const SpaceHeight(AppDimens.spacing32pt),
          CustomText.h5(
            message,
            color: AppColors.hint,
          ),
        ],
      ),
    );
  }
}
