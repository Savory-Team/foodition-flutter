import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/constants/dimens.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomText.h1(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing32pt,
    this.fontWeight = FontWeight.w700,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h2(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing24pt,
    this.fontWeight = FontWeight.w600,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h3(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing20pt,
    this.fontWeight = FontWeight.w600,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h4(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing18pt,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h5(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing16pt,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h6(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing14pt,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h7(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing12pt,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h8(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing10pt,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });
  const CustomText.h9(
    this.data, {
    super.key,
    this.fontSize = AppDimens.spacing8pt,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
