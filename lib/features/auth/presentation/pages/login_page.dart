import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';
import '../../../../core/constants/dimens.dart';
import '../../../../core/core.dart';
import '../../core/auth_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: ListView(
        padding: PaddingAll.spacing20pt,
        children: [
          const SpaceHeight(AppDimens.spacing32pt),
          Padding(
            padding: PaddingHorizontal.spacing80pt,
            child: Assets.images.fooditionPrimary.image(),
          ),
          const SpaceHeight(AppDimens.spacing48pt),
          const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimens.spacing24pt,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SpaceHeight(AppDimens.spacing16pt),
          const Text(
            'Enter your username and password to login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppDimens.spacing16pt,
              color: AppColors.black,
            ),
          ),
          const SpaceHeight(AppDimens.spacing32pt),
          CustomTextField(
            controller: emailController,
            label: 'Email',
            icon: Icons.email,
          ),
          const SpaceHeight(AppDimens.spacing16pt),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
            icon: Icons.lock,
          ),
          const SpaceHeight(AppDimens.spacing8pt),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: const Text('Forgot Password?'),
            ),
          ),
          const SpaceHeight(AppDimens.spacing20pt),
          Button.filled(
            onPressed: () {},
            label: 'Login',
          ),
          const SpaceHeight(AppDimens.spacing16pt),
          InkWell(
            onTap: () {
              context.goNamed(AuthRouter.register);
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Don\'t have an account? ',
                children: [
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                style: TextStyle(
                  fontSize: AppDimens.spacing16pt,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
