import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../core/core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
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
            title: const CustomText.h5('Fauzan Abdillah',
                fontWeight: FontWeight.w600),
            subtitle: const CustomText.h5('examle@email.com'),
            trailing: IconButton(
              onPressed: () => context.pushNamed(FooditionRouter.editProfile),
              icon: Padding(
                padding: PaddingAll.spacing4pt,
                child: Assets.icons.edit.svg(),
              ),
            ),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          CachedNetworkImage(
            imageUrl:
                'https://images.tokopedia.net/img/KRMmCm/2022/5/30/162875b9-af53-4fec-a7ec-67cb6b716867.jpg',
            width: double.infinity,
            height: 240.0,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          ListTile(
            tileColor: AppColors.white,
            onTap: () => context.pushNamed(FooditionRouter.myStore),
            leading: Assets.icons.myShop.svg(),
            title: const CustomText.h4('Restoran Saya'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          ColoredBox(
            color: AppColors.white,
            child: Padding(
              padding: PaddingAll.spacing16pt,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText.h4('Pengaturan Akun'),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () => context.pushNamed(FooditionRouter.editAddress),
                    leading: Assets.icons.location.svg(),
                    title: const CustomText.h5('Alamat Saya'),
                    subtitle: const CustomText.h7('Atur alamat belanja saya'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () =>
                        context.pushNamed(FooditionRouter.notification),
                    leading: Assets.icons.notification.svg(),
                    title: const CustomText.h5('Notifikasi'),
                    subtitle:
                        const CustomText.h7('Lihat pesan notifikasi akun saya'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () =>
                        context.pushNamed(FooditionRouter.editPassword),
                    leading: Assets.icons.lock.svg(),
                    title: const CustomText.h5('Reset Password'),
                    subtitle: const CustomText.h7('Atur ulang kata sandi'),
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
                  const CustomText.h4('Seputar Foodition'),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: Assets.icons.location.svg(),
                    title: const CustomText.h5('Kenali Foodition'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: Assets.icons.location.svg(),
                    title: const CustomText.h5('Kebijakan dan Privacy Policy'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {},
                    leading: Assets.icons.location.svg(),
                    title: const CustomText.h5('Ulas Aplikasi Ini'),
                  ),
                ],
              ),
            ),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          ListTile(
            tileColor: AppColors.white,
            onTap: () {},
            leading: Assets.icons.information.svg(),
            title: const CustomText.h4('Versi'),
            trailing: const CustomText.h5('1.0.0'),
          ),
          const SpaceHeight(AppDimens.spacing12pt),
          ListTile(
            tileColor: AppColors.white,
            onTap: () {},
            leading: Assets.icons.logout.svg(),
            title: const CustomText.h4('Keluar Akun', color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
