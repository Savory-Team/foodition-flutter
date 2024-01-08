import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../foodition.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final imagePicker = ImagePicker();
  XFile? xFile;
  final result = PredictionResult(
    result: 'Makanan ini Layak',
    explanation:
        'Lorem ipsum dolor sit amet consectetur. Aliquet tellus duis quam cursus sollicitudin non diam aliquam ipsum. Tellus arcu scelerisque nibh ut posuere odio mauris.',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Scan Kelayakan Makanan'),
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
          : Center(
              child: Assets.images.image.image(height: 50.0),
            ),
      bottomNavigationBar: ColoredBox(
        color: AppColors.white,
        child: Padding(
          padding: PaddingAll.spacing20pt,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Button.outlined(
                      onPressed: () async {
                        final result = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        xFile = result;
                        setState(() {});
                      },
                      label: 'Gallery',
                    ),
                  ),
                  const SpaceWidth(AppDimens.spacing16pt),
                  Flexible(
                    child: Button.outlined(
                      onPressed: () async {
                        final result = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        xFile = result;
                        setState(() {});
                      },
                      label: 'Camera',
                    ),
                  ),
                ],
              ),
              const SpaceHeight(AppDimens.spacing16pt),
              Button.filled(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: AppBorderRadius.radius8pt,
                        ),
                        title: CustomText.h3(result.result),
                        content: CustomText.h6(result.explanation),
                        actions: [
                          TextButton(
                            onPressed: () {
                              xFile = null;
                              context.pop();
                              setState(() {});
                            },
                            child: const CustomText.h3('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: 'Prediksi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
