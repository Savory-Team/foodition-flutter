import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../domain/models/models.dart';
import '../widgets/widgets.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ProductModel(
      name: 'Rumah Makan Masakan Padang Sejahtera',
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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Restoran Favorit'),
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (context, index) =>
            const SpaceHeight(AppDimens.spacing8pt),
        itemBuilder: (context, index) => FavouriteTile(
          data: products[index],
        ),
      ),
    );
  }
}
