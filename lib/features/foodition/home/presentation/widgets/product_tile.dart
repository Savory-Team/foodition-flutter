import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../home.dart';

class ProductTile extends StatelessWidget {
  final ProductModel data;
  const ProductTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                height: 170.0,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
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
                    CustomText.h5(
                      data.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpaceHeight(8.0),
                    LabelIcon(
                      icon: const Icon(
                        Icons.place_outlined,
                        size: 14.0,
                      ),
                      data: data.address,
                      isFlexible: true,
                    ),
                    const SpaceHeight(8.0),
                    CustomText.h5(data.priceFormat),
                    const SpaceHeight(8.0),
                    CustomText.h5('${data.stock} Porsi Tersedia'),
                    // const SpaceHeight(8.0),
                    // Wrap(
                    //   children: data.categories
                    //       .map((item) => Container(
                    //             decoration: BoxDecoration(
                    //               border: Border.all(color: AppColors.stroke),
                    //               borderRadius: AppBorderRadius.radius4pt,
                    //             ),
                    //             child: Padding(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: AppDimens.spacing8pt,
                    //                   vertical: AppDimens.spacing4pt),
                    //               child: CustomText.h8(item),
                    //             ),
                    //           ))
                    //       .toList(),
                    // ),
                    const SpaceHeight(10.0),
                    LabelIcon(
                      icon: const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 18.0,
                      ),
                      data: '${data.rate}',
                    ),
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
