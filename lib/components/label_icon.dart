import 'package:flutter/material.dart';

import '../core/core.dart';
import 'components.dart';

class LabelIcon extends StatelessWidget {
  final Widget icon;
  final String data;
  final bool isFlexible;
  const LabelIcon({
    super.key,
    required this.icon,
    required this.data,
    this.isFlexible = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isFlexible) {
      return Row(
        children: [
          icon,
          const SpaceWidth(AppDimens.spacing4pt),
          Flexible(
            child: CustomText.h7(
              data,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          icon,
          const SpaceWidth(AppDimens.spacing4pt),
          CustomText.h7(
            data,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }
  }
}
