import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditPhoneNumberPage extends StatefulWidget {
  final String phoneNumber;
  const EditPhoneNumberPage(this.phoneNumber, {super.key});

  @override
  State<EditPhoneNumberPage> createState() => _EditPhoneNumberPageState();
}

class _EditPhoneNumberPageState extends State<EditPhoneNumberPage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.phoneNumber);
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
        title: const Text('Edit Nomor Handphone'),
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
            const CustomText.h4('Nomor Handphone'),
            const SpaceHeight(AppDimens.spacing8pt),
            CustomTextField(
              controller: controller,
              label: 'Nomor Handphone',
              prefix: const CustomText.h5('+62 '),
              keyboardType: TextInputType.number,
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
              .add(UserEvent.editPhoneNumber(controller.text)),
          label: 'Simpan',
        ),
      ),
    );
  }
}
