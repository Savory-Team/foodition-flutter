import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';

class EditRestaurantPage extends StatefulWidget {
  const EditRestaurantPage({super.key});

  @override
  State<EditRestaurantPage> createState() => _EditRestaurantPageState();
}

class _EditRestaurantPageState extends State<EditRestaurantPage> {
  late final TextEditingController nameController;
  late final TextEditingController usernameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController sloganController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    nameController = TextEditingController();
    usernameController = TextEditingController();
    phoneNumberController = TextEditingController();
    sloganController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    sloganController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Informasi Restoran'),
      ),
      body: ListView(
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
              child: const CustomText.h5('Ubah Foto Restoran'),
            ),
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const Divider(),
          Padding(
            padding: PaddingAll.spacing20pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText.h4('Nama Restoran'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: nameController,
                  label: 'Masukkan Nama Toko',
                  onChanged: (value) {},
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Username Restoran'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: usernameController,
                  label: 'Username',
                  onChanged: (value) {},
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Nomor Handphone'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: phoneNumberController,
                  label: 'Nomor Handphone',
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Slogan'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: sloganController,
                  label: 'Slogan',
                  onChanged: (value) {},
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Deskripsi'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: descriptionController,
                  label: 'Deskripsi',
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () {
            context.pop();
          },
          label: 'Simpan',
        ),
      ),
    );
  }
}