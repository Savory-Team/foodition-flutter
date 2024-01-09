import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({super.key});

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  late final TextEditingController oldPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
      ),
      body: ListView(
        padding: PaddingAll.spacing20pt,
        children: [
          const CustomText.h4('Password Lama'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomTextField(
            controller: oldPasswordController,
            label: 'Password Lama',
            obscureText: true,
            icon: Icons.lock,
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Password Baru'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomTextField(
            controller: newPasswordController,
            label: 'Password Baru',
            obscureText: true,
            icon: Icons.lock,
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Konfirmasi Password Baru'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomTextField(
            controller: confirmNewPasswordController,
            label: 'Konfirmasi Password Baru',
            obscureText: true,
            icon: Icons.lock,
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
