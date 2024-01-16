import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../foodition/core/core.dart';
import '../../foodition/profile/presentation/managers/user/user_bloc.dart';
import '../core/introduction_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(const UserEvent.getData());
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        success: (_) => context.goNamed(FooditionRouter.root),
        error: (_) => context.goNamed(IntroductionRouter.introduction),
      ),
      child: Scaffold(
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
      ),
    );
  }
}
