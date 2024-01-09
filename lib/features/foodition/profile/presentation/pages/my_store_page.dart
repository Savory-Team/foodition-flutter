import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/constants/constants.dart';

class MyStorePage extends StatelessWidget {
  const MyStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Restoran Saya'),
      ),
      body: ListView(
        children: [
          ListTile(
            tileColor: AppColors.white,
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdnwpseller.gramedia.net/wp-content/uploads/2023/02/luffy.jpg',
                width: 64.0,
                height: 64.0,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
            title:
                const CustomText.h5('Lorem ipsum', fontWeight: FontWeight.w600),
            subtitle: const CustomText.h7(
                'Rumah masakan padang terenak di Yogyakarta'),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          const ColoredBox(
            color: AppColors.white,
            child: Padding(
              padding: PaddingAll.spacing16pt,
              child: Row(
                children: [
                  CustomText.h4('Rating'),
                  Spacer(),
                  LabelIcon(
                    icon: Icon(
                      Icons.star,
                      size: AppDimens.spacing16pt,
                      color: AppColors.yellow,
                    ),
                    data: '4.8/5.0',
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
                    onTap: () {},
                    title: const CustomText.h4('Daftar Menu'),
                    subtitle: const CustomText.h6('1 Menu'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    title: const CustomText.h4('Penjualan Makanan'),
                    subtitle: const CustomText.h6('Penjualan sebagai seller'),
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
                    onTap: () {},
                    leading:
                        Assets.icons.edit.svg(width: AppDimens.spacing24pt),
                    title: const CustomText.h5('Edit Informasi Restoran'),
                    subtitle: const CustomText.h7(
                        'Atur informasi restoran agar memudahkan pembeli'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: Assets.icons.location.svg(),
                    title: const CustomText.h5('Alamat Restoran'),
                    subtitle: const CustomText.h7('Atur alamat restoranmu'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
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
    );
  }
}
