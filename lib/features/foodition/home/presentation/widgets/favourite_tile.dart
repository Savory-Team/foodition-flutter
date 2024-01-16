import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/foodition_router.dart';
import '../../domain/models/models.dart';

class FavouriteTile extends StatelessWidget {
  final ProductModel data;
  const FavouriteTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(
        FooditionRouter.productDetail,
        extra: data,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.spacing32pt, vertical: AppDimens.spacing16pt),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppBorderRadius.radius12pt,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                width: 90.0,
                height: 90.0,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Assets.images.image.image(),
              ),
            ),
            const SpaceWidth(AppDimens.spacing12pt),
            SizedBox(
              width: context.deviceWidth - 166.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.h5(data.name,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  CustomText.h7(data.address, maxLines: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelIcon(
                        icon: const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                          size: AppDimens.spacing20pt,
                        ),
                        data: '${data.rate}/5.0',
                        fontSize: AppDimens.spacing14pt,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.red,
                          size: AppDimens.spacing20pt,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
