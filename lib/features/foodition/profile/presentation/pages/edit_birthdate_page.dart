import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditBirthdatePage extends StatefulWidget {
  final DateTime birthdate;
  const EditBirthdatePage(this.birthdate, {super.key});

  @override
  State<EditBirthdatePage> createState() => _EditBirthdatePageState();
}

class _EditBirthdatePageState extends State<EditBirthdatePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    final dateString =
        '${widget.birthdate.year}-${widget.birthdate.month}-${widget.birthdate.day}';
    controller = TextEditingController(text: dateString);
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
        title: const Text('Edit Tanggal Lahir'),
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
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () {
            final date = DateTime.tryParse(controller.text);
            if (date != null) {
              context.read<UserBloc>().add(UserEvent.editBirthdate(date));
            }
          },
          label: 'Simpan',
        ),
      ),
    );
  }
}
