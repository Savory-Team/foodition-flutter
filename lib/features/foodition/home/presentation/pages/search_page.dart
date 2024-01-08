import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../domain/models/models.dart';
import '../widgets/product_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
  late final List<ProductModel> products;
  late List<ProductModel> searchResult;
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    products = [product, product, product, product, product, product];
    searchResult = products;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Flexible(
            child: SearchInput(
              controller: searchController,
              onChanged: (value) {
                searchResult = products
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .toList();
                setState(() {});
              },
              autofocus: true,
            ),
          ),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'RESTORAN'),
              Tab(text: 'KOTA'),
            ],
          ),
        ),
        body: searchResult.isEmpty
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: context.deviceHeight / 4),
                  child: const EmptyState(),
                ),
              )
            : TabBarView(
                children: [
                  /// First Tab
                  ListView.separated(
                    padding: PaddingAll.spacing20pt,
                    itemCount: searchResult.length,
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(AppDimens.spacing16pt),
                    itemBuilder: (context, index) => ProductTile(
                      data: searchResult[index],
                    ),
                  ),

                  /// Second Tab
                  const CustomShimmerList(length: 3),
                  // ListView.separated(
                  //   padding: PaddingAll.spacing20pt,
                  //   itemCount: searchResult.length,
                  //   separatorBuilder: (context, index) =>
                  //       const SpaceHeight(AppDimens.spacing16pt),
                  //   itemBuilder: (context, index) => ProductTile(
                  //     data: searchResult[index],
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }
}
