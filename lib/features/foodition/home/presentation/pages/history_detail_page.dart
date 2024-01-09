import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../foodition.dart';

class HistoryDetailPage extends StatelessWidget {
  final HistoryModel data;
  const HistoryDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail History'),
      ),
      body: ListView(
        padding: PaddingAll.spacing20pt,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                flex: 1,
                child: Center(
                  child: _HistoryStatus(
                    number: 1,
                    label: 'Complete\nProfile',
                    isActive: true,
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: Center(
                  child: _HistoryStatus(
                    number: 2,
                    label: 'Menunggu\nDiambil',
                    isActive: true,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: _HistoryStatus(
                    number: 3,
                    label: 'Selesai',
                    isActive: data.status.isDone || data.status.isCanceled,
                    isCanceled: data.status.isCanceled,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(AppDimens.spacing32pt),
          Row(
            children: [
              const CustomText.h6('ID Transaksi'),
              const Spacer(),
              CustomText.h6(data.id),
            ],
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          Row(
            children: [
              const CustomText.h6('Nominal Pembayaran'),
              const Spacer(),
              CustomText.h6(data.priceFormat),
            ],
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          Row(
            children: [
              const CustomText.h6('Nama Restoran'),
              const Spacer(),
              CustomText.h6(data.storeName),
            ],
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          Row(
            children: [
              const CustomText.h6('Alamat Restoran'),
              const Spacer(),
              CustomText.h6(data.storeAddress),
            ],
          ),
          const SpaceHeight(AppDimens.spacing32pt),
          if (!data.status.isDone && !data.status.isCanceled)
            Button.filled(
              disabled: data.status.isDeliver,
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => CustomBottomSheet(
                  content: Column(
                    children: [
                      const CustomText.h3(
                        'Apakah anda yakin untuk membatalkan pesanan ini?',
                        textAlign: TextAlign.center,
                      ),
                      const SpaceHeight(AppDimens.spacing48pt),
                      Button.filled(
                        onPressed: () {
                          context.pop();
                        },
                        label: 'Yakin',
                      ),
                      const SpaceHeight(AppDimens.spacing16pt),
                      Button.outlined(
                        onPressed: () => context.pop(),
                        label: 'Kembali',
                      ),
                    ],
                  ),
                ),
              ),
              label: 'Batalkan Pesanan',
              color: AppColors.red,
            )
          else if (data.status.isDone)
            Button.filled(
              disabled: !data.isNotRate,
              onPressed: () => showDialog(
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
                        full: const Icon(Icons.star, color: AppColors.yellow),
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
              ),
              label: 'Ulas Pesanan',
            ),
        ],
      ),
    );
  }
}

class _HistoryStatus extends StatelessWidget {
  final int number;
  final String label;
  final bool isActive;
  final bool isCanceled;

  const _HistoryStatus({
    required this.number,
    required this.label,
    required this.isActive,
    this.isCanceled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(height: 4.0)),
            Container(
              width: 50.0,
              height: 50.0,
              padding: PaddingAll.spacing12pt,
              margin: PaddingAll.spacing12pt,
              decoration: BoxDecoration(
                color: isActive
                    ? isCanceled
                        ? AppColors.red
                        : AppColors.primary
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                border: isActive ? null : Border.all(color: AppColors.primary),
              ),
              child: Center(
                child: CustomText.h4(
                  '$number',
                  color: isActive ? AppColors.white : AppColors.primary,
                ),
              ),
            ),
            const Expanded(child: Divider(height: 2.0)),
          ],
        ),
        const SpaceHeight(AppDimens.spacing8pt),
        CustomText.h6(isCanceled ? 'Canceled' : label,
            textAlign: TextAlign.center),
      ],
    );
  }
}
