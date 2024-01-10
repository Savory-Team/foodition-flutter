import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../foodition/core/core.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        children: [
          const SpaceHeight(AppDimens.spacing64pt),
          const CustomText.h2('Account Verification'),
          const SpaceHeight(AppDimens.spacing10pt),
          const CustomText.h6(
              'Enter 6 digit OTP that we sent to your email example@email.com for verification'),
          const SpaceHeight(AppDimens.spacing24pt),
          PinInput(
            onDone: (value) => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: AppColors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppBorderRadius.radius8pt,
                  ),
                  title: const CustomText.h3('Registrasi Berhasil!'),
                  content: const CustomText.h6(
                      'Lorem ipsum dolor sit amet consectetur. Aliquet tellus duis quam cursus sollicitudin non diam aliquam ipsum. Tellus arcu scelerisque nibh ut posuere odio mauris.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.goNamed(FooditionRouter.root);
                      },
                      child: const CustomText.h3('OK'),
                    ),
                  ],
                );
              },
            ),
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          Row(
            children: [
              const CustomText.h6('Didn\'t receive any code? '),
              InkWell(
                onTap: () {},
                child: const CustomText.h6('Resend Code',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const CustomText.h7('Request new code in 00:30s'),
        ],
      ),
    );
  }
}
