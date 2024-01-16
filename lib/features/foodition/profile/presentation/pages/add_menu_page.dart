import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.gen.dart';
import '../../../../../core/constants/constants.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  late final TextEditingController statusController;
  late final TextEditingController nameController;
  late final TextEditingController portionController;
  late final TextEditingController categoryController;
  late final TextEditingController typeController;

  @override
  void initState() {
    statusController = TextEditingController(text: 'Layak Dimakan');
    nameController = TextEditingController();
    portionController = TextEditingController();
    categoryController = TextEditingController();
    typeController = TextEditingController(text: 'Berbayar');
    super.initState();
  }

  @override
  void dispose() {
    statusController.dispose();
    nameController.dispose();
    portionController.dispose();
    categoryController.dispose();
    typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Menu'),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://asset.kompas.com/crops/B_DV5V6k-8yyl8Z9daS3hb6E3_M=/0x0:739x493/750x500/data/photo/2020/07/28/5f1fdcdacafc4.jpg',
            width: double.infinity,
            height: 430.0,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Assets.images.image.image(),
          ),
          Padding(
            padding: PaddingAll.spacing20pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText.h4('Status Makanan'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: statusController,
                  label: 'Status makanan',
                  onChanged: (value) {},
                  readOnly: true,
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Nama Menu'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: nameController,
                  label: 'Nama menu',
                  onChanged: (value) {},
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Porsi Tersedia'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: portionController,
                  label: 'Porsi tersedia',
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Kategori'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomTextField(
                  controller: categoryController,
                  label: 'Kategori',
                  onChanged: (value) {},
                ),
                const SpaceHeight(AppDimens.spacing24pt),
                const CustomText.h4('Tipe'),
                const SpaceHeight(AppDimens.spacing8pt),
                CustomDropdown(
                  value: typeController.text,
                  items: const ['Berbayar', 'Gratis'],
                  label: 'Tipe',
                  onChanged: (value) {
                    typeController.text = value!;
                  },
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
