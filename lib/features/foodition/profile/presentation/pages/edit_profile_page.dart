import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../core/core.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profile'),
      ),
      body: ListView(
        padding: PaddingVertical.spacing24pt,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: CachedNetworkImage(
                imageUrl:
                    'https://cdnwpseller.gramedia.net/wp-content/uploads/2023/02/luffy.jpg',
                width: 72.0,
                height: 72.0,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          const SpaceHeight(AppDimens.spacing16pt),
          Center(
            child: InkWell(
              onTap: () {},
              child: const CustomText.h5('Ubah Foto Profile'),
            ),
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const Divider(),
          Padding(
            padding: PaddingAll.spacing20pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText.h4('Info Profile'),
                const SpaceHeight(AppDimens.spacing20pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editName),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Nama')),
                      Expanded(
                          flex: 2,
                          child: CustomText.h6('Fauzan Abdillah',
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editUsername),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Username')),
                      Expanded(
                          flex: 2,
                          child: CustomText.h6('Buat username yang unik')),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editBio),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Bio')),
                      Expanded(
                          flex: 2, child: CustomText.h6('Tulis bio tentangmu')),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: PaddingAll.spacing20pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText.h4('Info Pribadi'),
                const SpaceHeight(AppDimens.spacing20pt),
                Row(
                  children: [
                    const Expanded(flex: 1, child: CustomText.h6('User ID')),
                    const Expanded(
                        flex: 2,
                        child: CustomText.h6('12345678',
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                            const ClipboardData(text: '12345678'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: CustomText.h6('User ID telah disalin'),
                            backgroundColor: AppColors.white,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Assets.icons.copy.svg(width: 20.0),
                    ),
                  ],
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editEmail),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('E-mail')),
                      Expanded(
                          flex: 2,
                          child: CustomText.h6('example@email.com',
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () =>
                      context.pushNamed(FooditionRouter.editPhoneNumber),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Nomor HP')),
                      Expanded(flex: 2, child: CustomText.h6('Belum diatur')),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editGender),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Jenis Kelamin')),
                      Expanded(flex: 2, child: CustomText.h6('Belum diatur')),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                const SpaceHeight(AppDimens.spacing16pt),
                InkWell(
                  onTap: () => context.pushNamed(FooditionRouter.editBirthdate),
                  child: const Row(
                    children: [
                      Expanded(flex: 1, child: CustomText.h6('Tanggal Lahir')),
                      Expanded(flex: 2, child: CustomText.h6('Belum diatur')),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
