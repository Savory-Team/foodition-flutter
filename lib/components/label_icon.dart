import 'package:flutter/material.dart';

import '../../../../components/custom_text.dart';
import '../core/core.dart';
import 'components.dart';

class LabelIcon extends StatelessWidget {
  final Widget icon;
  final String data;
  const LabelIcon({
    super.key,
    required this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
