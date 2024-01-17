import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../managers/product_me/product_me_bloc.dart';
import '../widgets/widgets.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductMeBloc>().add(const ProductMeEvent.getData());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Menu'),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(FooditionRouter.menuCheck),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ProductMeBloc, ProductMeState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const CustomShimmerList(length: 4),
          empty: () => Padding(
            padding: EdgeInsets.only(top: context.deviceHeight / 4),
            child: const Center(child: EmptyState()),
          ),
          error: (message) => Padding(
            padding: EdgeInsets.only(top: context.deviceHeight / 4),
            child: ErrorState(
              message: message,
              onRefresh: () => context
                  .read<ProductMeBloc>()
                  .add(const ProductMeEvent.getData()),
            ),
          ),
          success: (products) => ListView.separated(
            padding: PaddingAll.spacing20pt,
            separatorBuilder: (context, index) =>
                const SpaceHeight(AppDimens.spacing16pt),
            itemCount: products.length,
            itemBuilder: (context, index) => MenuTile(
              data: products[index],
            ),
          ),
        ),
      ),
    );
  }
}
