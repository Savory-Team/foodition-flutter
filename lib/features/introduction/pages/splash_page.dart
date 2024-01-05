import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/core.dart';
import '../core/introduction_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => context.goNamed(IntroductionRouter.introduction),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimens.spacing32pt)),
              child: Assets.images.fooditionPrimary.image(width: 164.0),
            ),
            const SpaceHeight(AppDimens.spacing48pt),
            const Text(
              'Foodition',
              style: TextStyle(
                fontSize: AppDimens.spacing32pt,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SpaceHeight(AppDimens.spacing16pt),
            const Text(
              'Makanan hemat yang enak',
              style: TextStyle(
                fontSize: AppDimens.spacing16pt,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
