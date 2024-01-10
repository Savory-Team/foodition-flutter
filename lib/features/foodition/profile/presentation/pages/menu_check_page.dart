import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../home/domain/enums/prediction_status.dart';
import '../../../home/domain/models/prediction_result.dart';

class MenuCheckPage extends StatefulWidget {
  const MenuCheckPage({super.key});

  @override
  State<MenuCheckPage> createState() => _MenuCheckPageState();
}

class _MenuCheckPageState extends State<MenuCheckPage> {
  final imagePicker = ImagePicker();
  XFile? xFile;
  final result = PredictionResult(
    status: PredictionStatus.proper,
    result: 'Makanan ini Layak',
    explanation:
        'Lorem ipsum dolor sit amet consectetur. Aliquet tellus duis quam cursus sollicitudin non diam aliquam ipsum. Tellus arcu scelerisque nibh ut posuere odio mauris.',
  );

  void openCamera() async {
    final result = await imagePicker.pickImage(source: ImageSource.camera);
    xFile = result;
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async => openCamera());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Check Makanan'),
      ),
      body: xFile != null
          ? Center(
              child: Image.file(
                File(xFile!.path),
                width: context.deviceWidth,
                height: context.deviceHeight,
                fit: BoxFit.contain,
              ),
            )
          : InkWell(
              onTap: () async => openCamera(),
              child: Center(
                child: Assets.images.image.image(height: 50.0),
              ),
            ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: Padding(
          padding: PaddingAll.spacing20pt,
          child: Button.filled(
            disabled: xFile == null,
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.radius8pt,
                    ),
                    title: result.status.isProper
                        ? CustomText.h3(result.result)
                        : null,
                    content: result.status.isProper
                        ? CustomText.h6(result.explanation)
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.images.failed.image(width: 150.0),
                              const SpaceHeight(AppDimens.spacing24pt),
                              const CustomText.h3(
                                'Maaf\nMakanan ini sudah tidak layak untuk dimakan',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (result.status.isProper) {
                            /// TODO: push to ----
                          } else {
                            context.pop();
                          }
                          xFile = null;
                        },
                        child: const CustomText.h3('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            label: 'Lanjutkan',
          ),
        ),
      ),
    );
  }
}
