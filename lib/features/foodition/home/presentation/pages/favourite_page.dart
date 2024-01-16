import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/core.dart';
import '../managers/product/product_bloc.dart';
import '../widgets/widgets.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Restoran Favorit'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const CustomShimmerList(length: 4),
          empty: () => const EmptyState(),
          error: (message) => ErrorState(
            message: message,
            onRefresh: () =>
                context.read<ProductBloc>().add(const ProductEvent.getData()),
          ),
          success: (products, favourites) {
            if (favourites.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: context.deviceHeight / 4),
                child: const Center(child: EmptyState()),
              );
            }
            return ListView.separated(
              itemCount: favourites.length,
              separatorBuilder: (context, index) =>
                  const SpaceHeight(AppDimens.spacing8pt),
              itemBuilder: (context, index) => FavouriteTile(
                data: favourites[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
