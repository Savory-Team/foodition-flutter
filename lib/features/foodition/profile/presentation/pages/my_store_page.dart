import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../managers/resto/resto_bloc.dart';

class MyStorePage extends StatelessWidget {
  const MyStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RestoBloc>().add(const RestoEvent.getData());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Restoran Saya'),
      ),
      body: BlocConsumer<RestoBloc, RestoState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => context.dismissLoadingDialog(),
          loading: () => context.showLoadingDialog(),
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (data) => ListView(
            children: [
              ListTile(
                tileColor: AppColors.white,
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: CachedNetworkImage(
                    imageUrl: data.imageUrl,
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Assets.images.image.image(),
                  ),
                ),
                title: CustomText.h5(data.name, fontWeight: FontWeight.w600),
                subtitle: CustomText.h7(data.description),
              ),
              const SpaceHeight(AppDimens.spacing12pt),
              ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: PaddingAll.spacing16pt,
                  child: Row(
                    children: [
                      const CustomText.h4('Rating'),
                      const Spacer(),
                      LabelIcon(
                        icon: const Icon(
                          Icons.star,
                          size: AppDimens.spacing16pt,
                          color: AppColors.yellow,
                        ),
                        data: '${data.rate}/5.0',
                      ),
                    ],
                  ),
                ),
              ),
              const SpaceHeight(AppDimens.spacing12pt),
              ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: PaddingAll.spacing16pt,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () =>
                            context.pushNamed(FooditionRouter.menuList),
                        title: const CustomText.h4('Daftar Menu'),
                        subtitle: CustomText.h6('${data.totalProduct} Menu'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () =>
                            context.pushNamed(FooditionRouter.salesHistory),
                        title: const CustomText.h4('Penjualan Makanan'),
                        subtitle:
                            const CustomText.h6('Penjualan sebagai seller'),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
              const SpaceHeight(AppDimens.spacing12pt),
              ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: PaddingAll.spacing16pt,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText.h4('Pengaturan Restoran'),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () => context.pushNamed(
                            FooditionRouter.editRestaurant,
                            extra: data),
                        leading:
                            Assets.icons.edit.svg(width: AppDimens.spacing24pt),
                        title: const CustomText.h5('Edit Informasi Restoran'),
                        subtitle: const CustomText.h7(
                            'Atur informasi restoran agar memudahkan pembeli'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () => context.pushNamed(
                            FooditionRouter.editAddress,
                            extra: data.address),
                        leading: Assets.icons.location.svg(),
                        title: const CustomText.h5('Alamat Restoran'),
                        subtitle: const CustomText.h7('Atur alamat restoranmu'),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () => context
                            .pushNamed(FooditionRouter.notificationRestaurant),
                        leading: Assets.icons.notification.svg(),
                        title: const CustomText.h5('Notifikasi'),
                        subtitle: const CustomText.h7(
                            'Lihat pesan notifikasi restoran saya'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
