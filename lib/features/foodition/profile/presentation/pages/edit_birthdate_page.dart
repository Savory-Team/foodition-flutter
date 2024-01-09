import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';

class EditBirthdatePage extends StatefulWidget {
  const EditBirthdatePage({super.key});

  @override
  State<EditBirthdatePage> createState() => _EditBirthdatePageState();
}

class _EditBirthdatePageState extends State<EditBirthdatePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Tanggal Lahir'),
      ),
      body: ListView(
        padding: PaddingAll.spacing20pt,
        children: [
          const CustomText.h4('Tanggal Lahir'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomTextField(
            controller: controller,
            label: 'Tanggal Lahir',
            icon: Icons.person,
            keyboardType: TextInputType.datetime,
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
