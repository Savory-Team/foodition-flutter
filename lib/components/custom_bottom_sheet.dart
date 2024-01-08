import 'package:flutter/material.dart';

import '../core/core.dart';
import 'components.dart';

class CustomBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;

  const CustomBottomSheet({
    super.key,
    this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
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
                      borderRadius: BorderRadius.circular(AppDimens.spacing8pt),
                    ),
                  ),
                ),
                if (title != null)
                  const SpaceHeight(AppDimens.spacing16pt)
                else
                  const SpaceHeight(AppDimens.spacing48pt),
                if (title != null) ...[
                  CustomText.h2(title!),
                  const SpaceHeight(AppDimens.spacing32pt),
                ],
                Align(alignment: Alignment.centerLeft, child: content),
                const SpaceHeight(AppDimens.spacing32pt),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
