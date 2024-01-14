import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../core/auth_router.dart';
import '../../data/models/models.dart';
import '../managers/auth/auth_bloc.dart';
import '../widget/countdown_otp.dart';

class VerificationPage extends StatelessWidget {
  final RegisterRequest request;
  const VerificationPage({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final isReSendOtp = ValueNotifier(false);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => context.dismissLoadingDialog(),
            loading: () => context.showLoadingDialog(),
            successListen: () {
              context.dismissLoadingDialog();
              context.goNamed(AuthRouter.login);
              context.showSuccessMessage('Registrasi Berhasil!');
            },
            error: (message) {
              context.dismissLoadingDialog();
              context.showErrorMessage(message);
            },
          );
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
          children: [
            const SpaceHeight(AppDimens.spacing64pt),
            const CustomText.h2('Account Verification'),
            const SpaceHeight(AppDimens.spacing10pt),
            CustomText.h6(
                'Enter 6 digit OTP that we sent to your email ${request.email} for verification'),
            const SpaceHeight(AppDimens.spacing24pt),
            PinInput(
              onDone: (value) => context.read<AuthBloc>().add(AuthEvent.verify(
                    VerifyRequest(
                      email: request.email,
                      otp: value,
                    ),
                  )),
            ),
            const SpaceHeight(AppDimens.spacing24pt),
            Row(
              children: [
                const CustomText.h6('Didn\'t receive any code? '),
                ValueListenableBuilder(
                  valueListenable: isReSendOtp,
                  builder: (context, value, _) => InkWell(
                    onTap: value
                        ? () {
                            context
                                .read<AuthBloc>()
                                .add(AuthEvent.reSendOtp(request.email));
                            context.showSuccessMessage('OTP berhasil dikirim!');
                          }
                        : null,
                    child: CustomText.h6(
                      'Resend Code',
                      fontWeight: FontWeight.bold,
                      color: value ? AppColors.black : AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const CountdownOtp(600),
          ],
        ),
      ),
    );
  }
}
