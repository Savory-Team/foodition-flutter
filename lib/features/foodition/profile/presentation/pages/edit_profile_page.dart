import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../auth/presentation/managers/auth/auth_bloc.dart';
import '../../../core/core.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profile'),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (data) => ListView(
            padding: PaddingVertical.spacing24pt,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: CachedNetworkImage(
                    imageUrl: data.imageUrl,
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
                      child: Row(
                        children: [
                          const Expanded(flex: 1, child: CustomText.h6('Nama')),
                          Expanded(
                              flex: 2,
                              child: CustomText.h6(data.name,
                                  fontWeight: FontWeight.bold)),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing16pt),
                    InkWell(
                      onTap: () =>
                          context.pushNamed(FooditionRouter.editUsername),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1, child: CustomText.h6('Username')),
                          if (data.username != null)
                            Expanded(
                                flex: 2,
                                child: CustomText.h6(data.username!,
                                    fontWeight: FontWeight.bold))
                          else
                            const Expanded(
                                flex: 2,
                                child:
                                    CustomText.h6('Buat username yang unik')),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing16pt),
                    InkWell(
                      onTap: () => context.pushNamed(FooditionRouter.editBio),
                      child: Row(
                        children: [
                          const Expanded(flex: 1, child: CustomText.h6('Bio')),
                          if (data.bio != null)
                            Expanded(
                                flex: 2,
                                child: CustomText.h6(data.bio!,
                                    fontWeight: FontWeight.bold))
                          else
                            const Expanded(
                                flex: 2,
                                child: CustomText.h6('Tulis bio tentangmu')),
                          const Icon(Icons.chevron_right),
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
                        const Expanded(
                            flex: 1, child: CustomText.h6('User ID')),
                        Expanded(
                            flex: 2,
                            child: CustomText.h6(data.userId,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: data.userId));
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
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1, child: CustomText.h6('E-mail')),
                          Expanded(
                              flex: 2,
                              child: CustomText.h6(data.email,
                                  fontWeight: FontWeight.bold)),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing16pt),
                    InkWell(
                      onTap: () =>
                          context.pushNamed(FooditionRouter.editPhoneNumber),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1, child: CustomText.h6('Nomor HP')),
                          if (data.phoneNumber != null)
                            Expanded(
                                flex: 2,
                                child: CustomText.h6(data.phoneNumber!,
                                    fontWeight: FontWeight.bold))
                          else
                            const Expanded(
                                flex: 2, child: CustomText.h6('Belum diatur')),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing16pt),
                    InkWell(
                      onTap: () =>
                          context.pushNamed(FooditionRouter.editGender),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1, child: CustomText.h6('Jenis Kelamin')),
                          if (data.gender != null)
                            Expanded(
                                flex: 2,
                                child: CustomText.h6(data.gender!,
                                    fontWeight: FontWeight.bold))
                          else
                            const Expanded(
                                flex: 2, child: CustomText.h6('Belum diatur')),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                    const SpaceHeight(AppDimens.spacing16pt),
                    InkWell(
                      onTap: () =>
                          context.pushNamed(FooditionRouter.editBirthdate),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 1, child: CustomText.h6('Tanggal Lahir')),
                          if (data.birthdate != null)
                            Expanded(
                                flex: 2,
                                child: CustomText.h6(data.birthdateFormat!,
                                    fontWeight: FontWeight.bold))
                          else
                            const Expanded(
                                flex: 2, child: CustomText.h6('Belum diatur')),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
