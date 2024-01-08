import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.goNamed(FooditionRouter.root),
    );

    return Scaffold(
      body: Padding(
        padding: PaddingAll.spacing20pt,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.success.image(height: 150.0),
            const SpaceHeight(AppDimens.spacing32pt),
            const CustomText.h3(
              'Pesanan telah diterima!\nSilahkan datang ke resto untuk mengambil makanan',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
