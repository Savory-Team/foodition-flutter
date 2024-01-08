import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../../domain/models/models.dart';

class HistoryTile extends StatelessWidget {
  final HistoryModel data;
  const HistoryTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        FooditionRouter.historyDetail,
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
        child: Column(
          children: [
            Row(
              children: [
                CustomText.h7(data.dateFormat),
                const Spacer(),
                _HistoryStatus(
                  label: data.status.label,
                  color: data.status.color,
                ),
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                ),
                const SpaceWidth(AppDimens.spacing12pt),
                SizedBox(
                  width: context.deviceWidth - 166.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.h5(data.name,
                          maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SpaceHeight(AppDimens.spacing4pt),
                      CustomText.h6(data.priceFormat),
                      const SpaceHeight(AppDimens.spacing10pt),
                      if (data.isNotRate)
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: AppColors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: AppBorderRadius.radius8pt,
                                    ),
                                    title: const CustomText.h3('Beri nilai'),
                                    content: RatingBar(
                                      initialRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ratingWidget: RatingWidget(
                                        full: const Icon(Icons.star,
                                            color: AppColors.yellow),
                                        half: const Icon(Icons.star_half,
                                            color: AppColors.yellow),
                                        empty: const Icon(Icons.star_border,
                                            color: AppColors.yellow),
                                      ),
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: AppDimens.spacing4pt),
                                      onRatingUpdate: (rating) {
                                        // TODO: on rating changed
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const CustomText.h3('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const _HistoryStatus(
                              label: 'Ulas',
                              useBorder: true,
                              textColor: AppColors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryStatus extends StatelessWidget {
  final String label;
  final Color color;
  final bool useBorder;
  final Color textColor;

  const _HistoryStatus({
    required this.label,
    this.color = Colors.transparent,
    this.useBorder = false,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.spacing8pt, vertical: AppDimens.spacing4pt),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.radius4pt,
        color: color,
        border: useBorder ? Border.all(color: AppColors.stroke) : null,
      ),
      child: CustomText.h7(label, color: textColor),
    );
  }
}
