import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditNamePage extends StatefulWidget {
  final String name;
  const EditNamePage(this.name, {super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    context.dismissLoadingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Nama'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => context.dismissLoadingDialog(),
            loading: () => context.showLoadingDialog(),
            success: (data) {
              context.dismissLoadingDialog();
              context.pop();
              context.showSuccessMessage('Berhasil diperbarui!');
            },
            error: (message) {
              context.dismissLoadingDialog();
              context.pop();
              context.showErrorMessage(message);
            },
          );
        },
        child: ListView(
          padding: PaddingAll.spacing20pt,
          children: [
            const CustomText.h4('Nama'),
            const SpaceHeight(AppDimens.spacing8pt),
            CustomTextField(
              controller: controller,
              label: 'Masukkan nama anda',
              icon: Icons.person,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () =>
              context.read<UserBloc>().add(UserEvent.editName(controller.text)),
          label: 'Simpan',
        ),
      ),
    );
  }
}
