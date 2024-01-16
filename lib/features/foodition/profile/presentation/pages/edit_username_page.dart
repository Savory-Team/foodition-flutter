import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditUsernamePage extends StatefulWidget {
  final String username;
  const EditUsernamePage(this.username, {super.key});

  @override
  State<EditUsernamePage> createState() => _EditUsernamePageState();
}

class _EditUsernamePageState extends State<EditUsernamePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.username);
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
        title: const Text('Edit Username'),
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
            const CustomText.h4('Username'),
            const SpaceHeight(AppDimens.spacing8pt),
            CustomTextField(
              controller: controller,
              label: 'Buat username yang unik',
              prefix: const CustomText.h5('@ '),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () => context
              .read<UserBloc>()
              .add(UserEvent.editUsername(controller.text)),
          label: 'Simpan',
        ),
      ),
    );
  }
}
