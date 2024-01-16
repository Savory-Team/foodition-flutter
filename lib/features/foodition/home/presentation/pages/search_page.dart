import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../domain/models/models.dart';
import '../widgets/product_tile.dart';

class SearchPage extends StatefulWidget {
  final List<ProductModel> products;
  const SearchPage({super.key, required this.products});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final List<ProductModel> products;
  late List<ProductModel> searchResult;
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    products = widget.products;
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
                    .where((element) => (element.name + element.address)
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
                  ListView.separated(
                    padding: PaddingAll.spacing20pt,
                    itemCount: searchResult.length,
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(AppDimens.spacing16pt),
                    itemBuilder: (context, index) => ProductTile(
                      data: searchResult[index],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
