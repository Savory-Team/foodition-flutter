import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditBioPage extends StatefulWidget {
  final String bio;
  const EditBioPage(this.bio, {super.key});

  @override
  State<EditBioPage> createState() => _EditBioPageState();
}

class _EditBioPageState extends State<EditBioPage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.bio);
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
        title: const Text('Edit Bio'),
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
            const CustomText.h4('Bio'),
            const SpaceHeight(AppDimens.spacing8pt),
            CustomTextField(
              controller: controller,
              label: 'Tulis bio tentangmu',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () =>
              context.read<UserBloc>().add(UserEvent.editBio(controller.text)),
          label: 'Simpan',
        ),
      ),
    );
  }
}
