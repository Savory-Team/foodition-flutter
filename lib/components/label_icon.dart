import 'package:flutter/material.dart';

import '../core/core.dart';
import 'components.dart';

class LabelIcon extends StatelessWidget {
  final Widget icon;
  final String data;
  final bool isFlexible;
  final double fontSize;
  final FontWeight fontWeight;

  const LabelIcon({
    super.key,
    required this.icon,
    required this.data,
    this.isFlexible = false,
    this.fontSize = AppDimens.spacing12pt,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    if (isFlexible) {
      return Row(
        children: [
          icon,
          const SpaceWidth(AppDimens.spacing4pt),
          Flexible(
            child: Text(
              data,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          icon,
          const SpaceWidth(AppDimens.spacing4pt),
          Text(
            data,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.black,
            ),
          ),
        ],
      );
    }
  }
}
