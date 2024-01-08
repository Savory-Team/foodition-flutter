import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../components.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Assets.images.empty.image(height: 150.0),
          const SpaceHeight(AppDimens.spacing32pt),
          const CustomText.h5(
            'Data tidak ditemukan',
            color: AppColors.hint,
          ),
        ],
      ),
    );
  }
}
