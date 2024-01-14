import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../auth/presentation/managers/auth/auth_bloc.dart';
import '../../foodition/core/core.dart';
import '../core/introduction_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEvent.getData());
    return BlocListener<AuthBloc, AuthState>(
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
