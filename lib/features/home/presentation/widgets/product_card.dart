import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../domain/models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;

  const ProductCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: AppBorderRadius.radius8pt,
              child: CachedNetworkImage(
                imageUrl: data.imageUrl,
                height: 150.0,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Padding(
              padding: PaddingAll.spacing12pt,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.h5(data.name),
                  const SpaceHeight(8.0),
                  const LabelIcon(
                    icon: Icon(Icons.place_outlined),
                    data: 'Jakarta Selatan',
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
                      size: 14.0,
                    ),
                    data: '${data.rate}',
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
