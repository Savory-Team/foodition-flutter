import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../../data/models/request/product_request.dart';
import '../managers/product_me/product_me_bloc.dart';

class AddMenuPage extends StatefulWidget {
  final File image;
  const AddMenuPage({super.key, required this.image});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  late final TextEditingController statusController;
  // late final TextEditingController nameController;
  late final TextEditingController portionController;
  late final TextEditingController categoryController;
  late final TextEditingController typeController;

  @override
  void initState() {
    statusController = TextEditingController(text: 'Layak Dimakan');
    // nameController = TextEditingController();
    portionController = TextEditingController(text: '1');
    categoryController = TextEditingController();
    typeController = TextEditingController(text: 'Berbayar');
    super.initState();
  }

  @override
  void dispose() {
    statusController.dispose();
    // nameController.dispose();
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
      body: BlocListener<ProductMeBloc, ProductMeState>(
        listener: (context, state) {
          context.dismissLoadingDialog();
          state.maybeWhen(
            orElse: () {},
            loading: () {},
            success: (data) {
              context.pop();
              context.showSuccessMessage('Berhasil ditambahkan!');
              context.pushReplacementNamed(FooditionRouter.menuList);
            },
            error: (message) {
              context.pop();
              context.showErrorMessage(message);
            },
          );
        },
        child: ListView(
          children: [
            Image.file(
              width: double.infinity,
              height: 430.0,
              fit: BoxFit.cover,
              widget.image,
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
                  // const SpaceHeight(AppDimens.spacing24pt),
                  // const CustomText.h4('Nama Menu'),
                  // const SpaceHeight(AppDimens.spacing8pt),
                  // CustomTextField(
                  //   controller: nameController,
                  //   label: 'Nama menu',
                  //   onChanged: (value) {},
                  // ),
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
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () => context
              .read<ProductMeBloc>()
              .add(ProductMeEvent.addProduct(ProductRequest(
                image: widget.image,
                status: true,
                type: typeController.text.contains('Berbayar'),
                portion: int.parse(portionController.text),
                category: categoryController.text,
              ))),
          label: 'Simpan',
        ),
      ),
    );
  }
}
