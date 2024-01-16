import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../managers/user/user_bloc.dart';

class EditGenderPage extends StatefulWidget {
  final String gender;
  const EditGenderPage(this.gender, {super.key});

  @override
  State<EditGenderPage> createState() => _EditGenderPageState();
}

class _EditGenderPageState extends State<EditGenderPage> {
  late int currentIndex;

  @override
  void initState() {
    if (widget.gender.contains('Perempuan')) {
      currentIndex = 1;
    } else {
      currentIndex = 0;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    context.dismissLoadingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Jenis Kelamin'),
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
        child: Padding(
          padding: PaddingAll.spacing32pt,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() => currentIndex = 0),
                child: Column(
                  children: [
                    Assets.icons.male.svg(
                      colorFilter: currentIndex == 0
                          ? const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                    const SpaceHeight(AppDimens.spacing8pt),
                    CustomText.h5(
                      'Laki-Laki',
                      color: currentIndex == 0
                          ? AppColors.primary
                          : AppColors.black,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => currentIndex = 1),
                child: Column(
                  children: [
                    Assets.icons.famale.svg(
                      colorFilter: currentIndex == 1
                          ? const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                    const SpaceHeight(AppDimens.spacing8pt),
                    CustomText.h5(
                      'Perempuan',
                      color: currentIndex == 1
                          ? AppColors.primary
                          : AppColors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () => context.read<UserBloc>().add(UserEvent.editGender(
              currentIndex == 0 ? 'Laki-laki' : 'Perempuan')),
          label: 'Simpan',
        ),
      ),
    );
  }
}
