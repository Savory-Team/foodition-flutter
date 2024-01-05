import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/components.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/core.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../auth/core/auth_router.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int currentIndex = 0;
  AssetGenImage image = Assets.images.rectangle;
  String text =
      'Lorem ipsum dolor sit amet consectetur. Et viverra tristique sit euismod.';
  String buttonTitle = 'Next';

  void nextTap(int index) {
    if (index == 0) {
      currentIndex++;
      image = Assets.images.rectangle;
      text = 'Lorem ipsum dolor. Et viverra tristique sit euismod.';
      buttonTitle = 'Next';
      setState(() {});
    } else if (index == 1) {
      currentIndex++;
      image = Assets.images.rectangle;
      text = 'Lorem ipsum dolor sit amet. Et viverra tristique sit euismod.';
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
              fit: BoxFit.fill),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.spacing32pt)),
              child: ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: PaddingHorizontal.spacing32pt,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SpaceHeight(AppDimens.spacing10pt),
                      Container(
                        width: 82,
                        height: 6,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: AppColors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppDimens.spacing8pt),
                          ),
                        ),
                      ),
                      const SpaceHeight(AppDimens.spacing48pt),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: AppDimens.spacing18pt,
                          fontWeight: FontWeight.w500,
                        ),
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
                      const SpaceHeight(AppDimens.spacing48pt),
                      Button.filled(
                        onPressed: () => nextTap(currentIndex),
                        label: buttonTitle,
                      ),
                      const SpaceHeight(AppDimens.spacing32pt),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
