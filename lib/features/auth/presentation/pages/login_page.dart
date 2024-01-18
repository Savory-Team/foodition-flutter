import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../foodition/core/core.dart';
import '../../core/auth_router.dart';
import '../../data/models/models.dart';
import '../managers/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => context.dismissLoadingDialog(),
            loading: () => context.showLoadingDialog(),
            successListen: () {
              context.dismissLoadingDialog();
              context.goNamed(FooditionRouter.root);
              context.showSuccessMessage('Berhasil!');
            },
            error: (message) {
              context.dismissLoadingDialog();
              context.showErrorMessage(message);
            },
          );
        },
        child: ListView(
          padding: PaddingAll.spacing20pt,
          children: [
            const SpaceHeight(AppDimens.spacing32pt),
            Padding(
              padding: PaddingHorizontal.spacing80pt,
              child: Assets.images.fooditionPrimary.image(),
            ),
            const SpaceHeight(AppDimens.spacing48pt),
            const CustomText.h1(
              'Login',
              textAlign: TextAlign.center,
              color: AppColors.primary,
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
            // const SpaceHeight(AppDimens.spacing8pt),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: InkWell(
            //     onTap: () {},
            //     child: const CustomText.h6('Forgot Password?'),
            //   ),
            // ),
            const SpaceHeight(AppDimens.spacing20pt),
            Button.filled(
              onPressed: () => context.read<AuthBloc>().add(AuthEvent.login(
                    LoginRequest(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  )),
              label: 'Login',
            ),
            const SpaceHeight(AppDimens.spacing16pt),
            InkWell(
              onTap: () => context.goNamed(AuthRouter.register),
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
      ),
    );
  }
}
