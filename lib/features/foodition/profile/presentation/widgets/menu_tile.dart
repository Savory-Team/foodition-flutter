import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/foodition_router.dart';
import '../../../home/domain/models/product_model.dart';

class MenuTile extends StatelessWidget {
  final ProductModel data;
  const MenuTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        FooditionRouter.productDetail,
        extra: data,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.radius8pt,
          ),
          shadows: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.5),
              blurRadius: 3,
              offset: const Offset(0, 0),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: AppBorderRadius.radius8pt,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                width: 170.0,
                height: 130.0,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Assets.images.image.image(),
              ),
            ),
            Padding(
              padding: PaddingAll.spacing12pt,
              child: SizedBox(
                width: context.deviceWidth - 234.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: AppBorderRadius.radius4pt,
                      child: ColoredBox(
                        color:
                            data.isActive ? AppColors.primary : AppColors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.spacing8pt,
                              vertical: AppDimens.spacing4pt),
                          child: CustomText.h8(data.status,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing8pt),
                    CustomText.h5(
                      data.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpaceHeight(AppDimens.spacing8pt),
                    CustomText.h6(data.priceFormat),
                    const SpaceHeight(AppDimens.spacing8pt),
                    CustomText.h7('${data.stock} Porsi Tersedia'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
