import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../core/auth_router.dart';
import '../../data/models/models.dart';
import '../managers/auth/auth_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    RegisterRequest request = RegisterRequest(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => context.dismissLoadingDialog(),
            loading: () => context.showLoadingDialog(),
            successListen: () {
              context.dismissLoadingDialog();
              context.goNamed(AuthRouter.verification, extra: request);
            },
            error: (message) {
              context.dismissLoadingDialog();
              context.showErrorMessage(message);
              if (message.contains('Email sudah digunakan')) {
                context.goNamed(AuthRouter.verification, extra: request);
              }
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
              'Register',
              textAlign: TextAlign.center,
            ),
            const SpaceHeight(AppDimens.spacing32pt),
            CustomTextField(
              controller: nameController,
              label: 'Name',
              icon: Icons.person,
            ),
            const SpaceHeight(AppDimens.spacing16pt),
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
            const SpaceHeight(AppDimens.spacing16pt),
            CustomTextField(
              controller: confirmPasswordController,
              label: 'Confirm Password',
              obscureText: true,
              icon: Icons.lock,
            ),
            const SpaceHeight(AppDimens.spacing20pt),
            Button.filled(
              onPressed: () {
                request = RegisterRequest(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                );
                context.read<AuthBloc>().add(AuthEvent.register(request));
              },
              label: 'Register',
            ),
            const SpaceHeight(AppDimens.spacing16pt),
            InkWell(
              onTap: () {
                context.goNamed(AuthRouter.login);
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Already have account? ',
                  children: [
                    TextSpan(
                      text: 'Login',
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
