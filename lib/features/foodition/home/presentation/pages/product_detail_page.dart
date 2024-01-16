import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../foodition.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel data;
  const ProductDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final priceSelected = ValueNotifier(data.priceFormat);
    final paymentCategorySelected = ValueNotifier(data.paymentCategories.first);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: data.imageUrl,
            width: double.infinity,
            height: 240.0,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: PaddingAll.spacing20pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: CustomText.h3(data.name)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        data.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color:
                            data.isFavourite ? AppColors.red : AppColors.black,
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomText.h7(data.address),
                const SpaceHeight(AppDimens.spacing8pt),
                LabelIcon(
                  icon: const Icon(
                    Icons.star,
                    size: 14.0,
                    color: AppColors.yellow,
                  ),
                  data: '${data.rate}/5.0',
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomText.h6(
                        'Porsi Tersedia',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomText.h6(
                        'Nominal Pembayaran',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing4pt),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomText.h6('${data.stock}'),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomText.h6(data.priceFormat),
                    ),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h3('Deskripsi'),
                const SpaceHeight(AppDimens.spacing12pt),
                CustomText.h6(data.description),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h3('Bayar sesukamu'),
                const SpaceHeight(AppDimens.spacing16pt),
                ValueListenableBuilder(
                  valueListenable: priceSelected,
                  builder: (context, value, _) => Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: data.pricesFormat
                        .map((item) => GestureDetector(
                              onTap: () => priceSelected.value = item,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: value == item
                                      ? null
                                      : Border.all(color: AppColors.stroke),
                                  borderRadius: AppBorderRadius.radius4pt,
                                  color: value == item
                                      ? AppColors.primary
                                      : AppColors.background,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimens.spacing12pt,
                                      vertical: AppDimens.spacing4pt),
                                  child: CustomText.h6(
                                    item,
                                    color: value == item
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                ValueListenableBuilder(
                  valueListenable: paymentCategorySelected,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(AppDimens.spacing8pt),
                    itemCount: data.paymentCategories.length,
                    itemBuilder: (context, index) {
                      final item = data.paymentCategories[index];
                      final check = value.name == item.name;
                      return GestureDetector(
                        onTap: () => paymentCategorySelected.value = item,
                        child: Row(
                          children: [
                            Icon(
                              check
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color:
                                  check ? AppColors.primary : AppColors.black,
                            ),
                            const SpaceWidth(AppDimens.spacing10pt),
                            CustomText.h5(item.name),
                            const Spacer(),
                            InkWell(
                              onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (context) => ValueListenableBuilder(
                                  valueListenable: priceSelected,
                                  builder: (context, value, _) =>
                                      CustomBottomSheet(
                                    title: value,
                                    content: ValueListenableBuilder(
                                      valueListenable: paymentCategorySelected,
                                      builder: (context, value, _) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText.h4(
                                              'Kategori : ${value.name}'),
                                          const SpaceHeight(
                                              AppDimens.spacing4pt),
                                          CustomText.h4(
                                              'Restoran : ${value.restaurantPercent}'),
                                          const SpaceHeight(
                                              AppDimens.spacing4pt),
                                          CustomText.h4(
                                              'Foodition : ${value.fooditionPercent}'),
                                          const SpaceHeight(
                                              AppDimens.spacing4pt),
                                          CustomText.h4(
                                              'Donasi : ${value.donationPercent}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: const CustomText.h7('Detail'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h6('Pembayaran'),
                const SpaceHeight(AppDimens.spacing12pt),
                Row(
                  children: [
                    const CustomText.h3('Keterangan'),
                    const Spacer(),
                    CustomText.h6(data.paymentMethod.value),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing8pt),
                Row(
                  children: [
                    const CustomText.h6('Metode Pengambilan'),
                    const Spacer(),
                    CustomText.h6(data.pickUpMethod.value),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing32pt),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          onPressed: () {
            context.pushNamed(FooditionRouter.checkoutSuccess);
          },
          label: 'Beli Sekarang',
        ),
      ),
    );
  }
}
