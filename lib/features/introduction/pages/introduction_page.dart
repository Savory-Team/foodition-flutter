import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../auth/core/auth_router.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int currentIndex = 0;
  AssetGenImage image = Assets.images.introduction.first;
  String text =
      'Foodition - Tidak hanya soal makanan, tapi juga tentang meminimalkan pemborosan. Mari bersama-sama menjadi bagian dari solusi untuk mengurangi limbah makanan.';
  String buttonTitle = 'Next';

  void nextTap(int index) {
    if (index == 0) {
      currentIndex++;
      image = Assets.images.introduction.second;
      text =
          'Wadah bagi kebaikan Anda. Satu langkah, satu donasi makanan, dapat membawa perubahan besar untuk masyarakat';
      buttonTitle = 'Next';
      setState(() {});
    } else if (index == 1) {
      currentIndex++;
      image = Assets.images.introduction.third;
      text =
          'Disetiap suap makanan memiliki makna. Mari bersama-sama memberikan kesempatan kepada mereka yang membutuhkan.';
      buttonTitle = 'Next';
      buttonTitle = 'Let\'s Start';
      setState(() {});
    } else if (index == 2) {
      context.goNamed(AuthRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          image.image(
              width: context.deviceWidth,
              height: context.deviceHeight / 1.25,
              fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomSheet(
              content: Column(
                children: [
                  CustomText.h5(
                    text,
                    textAlign: TextAlign.center,
                  ),
                  const SpaceHeight(AppDimens.spacing32pt),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: currentIndex == 0
                            ? AppColors.primary
                            : AppColors.grey,
                        size: AppDimens.spacing14pt,
                      ),
                      const SpaceHeight(AppDimens.spacing8pt),
                      Icon(
                        Icons.circle,
                        color: currentIndex == 1
                            ? AppColors.primary
                            : AppColors.grey,
                        size: AppDimens.spacing14pt,
                      ),
                      const SpaceHeight(AppDimens.spacing8pt),
                      Icon(
                        Icons.circle,
                        color: currentIndex == 2
                            ? AppColors.primary
                            : AppColors.grey,
                        size: AppDimens.spacing14pt,
                      ),
                      const SpaceHeight(AppDimens.spacing8pt),
                    ],
                  ),
                  const SpaceHeight(AppDimens.spacing24pt),
                  Button.filled(
                    onPressed: () => nextTap(currentIndex),
                    label: buttonTitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
