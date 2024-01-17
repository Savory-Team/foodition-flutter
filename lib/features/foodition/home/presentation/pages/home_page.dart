import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../../../profile/presentation/managers/user/user_bloc.dart';
import '../../home.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(const ProductEvent.getData());
    context.read<UserBloc>().add(const UserEvent.getData());
    context.dismissLoadingDialog();
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductBloc>().add(const ProductEvent.getData());
            context.read<UserBloc>().add(const UserEvent.getData());
          },
          child: ListView(
            children: [
              Padding(
                padding: PaddingAll.spacing20pt,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) => state.maybeWhen(
                        orElse: () => const SizedBox.shrink(),
                        success: (data) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.h4('Hello, ${data.name}'),
                            LabelIcon(
                              icon: const Icon(
                                Icons.place_outlined,
                                size: 14.0,
                              ),
                              data: data.address.addressFormat,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          context.pushNamed(FooditionRouter.notification),
                      icon: Assets.icons.notification.svg(width: 30.0),
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
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return Padding(
                    padding: PaddingAll.spacing20pt,
                    child: SearchInput(
                      onTap: () => state.maybeWhen(
                        orElse: () => null,
                        empty: () =>
                            context.showErrorMessage('Produk kosong..'),
                        success: (products, favourites) => context
                            .goNamed(FooditionRouter.search, extra: products),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) => state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  loading: () => const CustomShimmerGrid(length: 2),
                  empty: () => const EmptyState(message: 'Produk tidak ada'),
                  error: (message) => ErrorState(
                    message: message,
                    onRefresh: () => context
                        .read<ProductBloc>()
                        .add(const ProductEvent.getData()),
                  ),
                  success: (products, favourites) => GridView.builder(
                    padding: PaddingHorizontal.spacing20pt,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              ),
              const SpaceHeight(20.0),
            ],
          ),
        ),
      ),
    );
  }
}
