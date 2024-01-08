import 'package:flutter/material.dart';

class AppDimens {
  const AppDimens._();
  static const double spacing4pt = 4.0;
  static const double spacing8pt = 8.0;
  static const double spacing10pt = 10.0;
  static const double spacing12pt = 12.0;
  static const double spacing14pt = 14.0;
  static const double spacing16pt = 16.0;
  static const double spacing18pt = 18.0;
  static const double spacing20pt = 20.0;
  static const double spacing24pt = 24.0;
  static const double spacing32pt = 32.0;
  static const double spacing40pt = 40.0;
  static const double spacing48pt = 48.0;
  static const double spacing64pt = 64.0;
  static const double spacing80pt = 80.0;
}

class PaddingHorizontal {
  const PaddingHorizontal._();
  static const spacing20pt =
      EdgeInsets.symmetric(horizontal: AppDimens.spacing20pt);
  static const spacing32pt =
      EdgeInsets.symmetric(horizontal: AppDimens.spacing32pt);
  static const spacing80pt =
      EdgeInsets.symmetric(horizontal: AppDimens.spacing80pt);
}

class PaddingVertical {
  const PaddingVertical._();
  static const spacing24pt =
      EdgeInsets.symmetric(vertical: AppDimens.spacing24pt);
}

class PaddingAll {
  const PaddingAll._();
  static const spacing4pt = EdgeInsets.all(AppDimens.spacing4pt);
  static const spacing8pt = EdgeInsets.all(AppDimens.spacing8pt);
  static const spacing12pt = EdgeInsets.all(AppDimens.spacing12pt);
  static const spacing16pt = EdgeInsets.all(AppDimens.spacing16pt);
  static const spacing20pt = EdgeInsets.all(AppDimens.spacing20pt);
  static const spacing32pt = EdgeInsets.all(AppDimens.spacing32pt);
  static const spacing64pt = EdgeInsets.all(AppDimens.spacing64pt);
  static const spacing80pt = EdgeInsets.all(AppDimens.spacing80pt);
}

class AppBorderRadius {
  const AppBorderRadius._();
  static const radius4pt =
      BorderRadius.all(Radius.circular(AppDimens.spacing4pt));
  static const radius8pt =
      BorderRadius.all(Radius.circular(AppDimens.spacing8pt));
  static const radius12pt =
      BorderRadius.all(Radius.circular(AppDimens.spacing12pt));
}
