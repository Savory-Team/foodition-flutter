import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/core.dart';

/// Use [CustomShimmerList] to create loading placeholder in a vertical list
/// [length] : define the length of shimmer list to display
/// [shrinkWrap] : Set it true if this widget is attached in a [Column]
/// [itemHeight] : define the height of shimmer item in the list (default: 180)
class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({
    super.key,
    required this.length,
    this.itemHeight,
    this.padding,
  });

  final int length;
  final double? itemHeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? const EdgeInsets.all(AppDimens.spacing16pt),
      itemBuilder: (context, index) => CustomShimmer(
        height: itemHeight ?? 170.0,
        width: context.deviceWidth,
      ),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimens.spacing16pt),
      itemCount: length,
    );
  }
}

/// Use [CustomShimmerGrid] to create loading placeholder in a grid
/// [length] : define the length of shimmer list to display
/// [shrinkWrap] : Set it true if this widget is attached in a [Column]
class CustomShimmerGrid extends StatelessWidget {
  const CustomShimmerGrid({
    super.key,
    required this.length,
    this.padding,
  });

  final int length;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? const EdgeInsets.all(AppDimens.spacing16pt),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimens.spacing16pt,
        crossAxisSpacing: AppDimens.spacing16pt,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (context, index) => const CustomShimmer(),
      itemCount: length,
    );
  }
}

/// Use [CustomShimmer] to create loading placeholder
class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width = 200.0,
    this.height = 100.0,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
  });

  final double width;
  final double height;
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade200,
      highlightColor: highlightColor ?? Colors.grey.shade300,
      child: Container(
        constraints: BoxConstraints(maxWidth: width, maxHeight: height),
        decoration: BoxDecoration(
          color: baseColor ?? AppColors.white,
          borderRadius: borderRadius ?? AppBorderRadius.radius8pt,
        ),
      ),
    );
  }
}
