import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../../home.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ProductModel(
      name: 'RM. Padang Sejahtera',
      imageUrl:
          'https://assets-pergikuliner.com/uploads/bootsy/image/18948/Nasi_Padang__pergikuliner.com_.jpeg',
      categories: ['Seafood', 'Masakan Padang', 'Home Made'],
      address: 'Jln. Pahlawan, No.16, Kabupaten Sleman, Yogyakarta, 12345',
      rate: 4.8,
      isFavourite: false,
      stock: 5,
      price: 10000,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      prices: [10000, 15000, 20000, 40000],
      paymentCategories: [
        PaymentCategory(
          name: 'Default',
          restaurant: 0.33,
          foodition: 0.33,
          donation: 0.34,
        ),
        PaymentCategory(
          name: 'Extra untuk Restoran',
          restaurant: 0.33,
          foodition: 0.33,
          donation: 0.34,
        ),
        PaymentCategory(
          name: 'Extra untuk Foodition',
          restaurant: 0.33,
          foodition: 0.33,
          donation: 0.34,
        ),
        PaymentCategory(
          name: 'Extra untuk Donasi',
          restaurant: 0.33,
          foodition: 0.33,
          donation: 0.34,
        ),
      ],
    );
    final products = [product, product, product, product, product, product];

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: PaddingAll.spacing20pt,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.h4('Hello, Fauzan Abdillah'),
                      LabelIcon(
                        icon: Icon(
                          Icons.place_outlined,
                          size: 14.0,
                        ),
                        data: 'Jakarta Selatan',
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () =>
                        context.pushNamed(FooditionRouter.notification),
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 30.0,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            BannerSlider(
              items: [
                Assets.images.banner.banner1.path,
                Assets.images.banner.banner2.path,
                Assets.images.banner.banner3.path,
              ],
            ),
            Padding(
              padding: PaddingAll.spacing20pt,
              child: SearchInput(
                onTap: () => context.goNamed(FooditionRouter.search),
              ),
            ),
            GridView.builder(
              padding: PaddingHorizontal.spacing20pt,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 0.5,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                data: products[index],
              ),
            ),
            const SpaceHeight(20.0),
          ],
        ),
      ),
    );
  }
}
