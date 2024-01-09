import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/constants/constants.dart';

class EditGenderPage extends StatefulWidget {
  const EditGenderPage({super.key});

  @override
  State<EditGenderPage> createState() => _EditGenderPageState();
}

class _EditGenderPageState extends State<EditGenderPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Jenis Kelamin'),
      ),
      body: Padding(
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
                    color:
                        currentIndex == 0 ? AppColors.primary : AppColors.black,
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
                    color:
                        currentIndex == 1 ? AppColors.primary : AppColors.black,
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
          onPressed: () {
            context.pop();
          },
          label: 'Simpan',
        ),
      ),
    );
  }
}
