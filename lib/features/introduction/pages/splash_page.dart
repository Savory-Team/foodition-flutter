import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../foodition/core/foodition_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      // FIXME: change to IntroductionRouter.introduction
      () => context.goNamed(FooditionRouter.myStore),
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
            const CustomText.h1(
              'Foodition',
              color: AppColors.primary,
            ),
            const CustomText.h5(
              'Makanan hemat yang enak',
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
