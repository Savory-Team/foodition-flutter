import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void showResultPredict(PredictionResult data) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.radius8pt,
        ),
        title: data.status.isEdible ? CustomText.h3(data.result) : null,
        content: data.status.isEdible
            ? CustomText.h6(data.explanation)
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
            onPressed: () => context.pop(),
            child: const CustomText.h3('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MlBloc, MlState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => context.dismissLoadingDialog(),
          loading: () => context.showLoadingDialog(),
          success: (data) {
            context.dismissLoadingDialog();
            showResultPredict(data);
          },
          error: (message) {
            context.dismissLoadingDialog();
            context.showErrorMessage(message);
          },
        );
      },
      child: Scaffold(
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
                  disabled: xFile == null,
                  onPressed: () {
                    context
                        .read<MlBloc>()
                        .add(MlEvent.predict(file: File(xFile!.path)));
                  },
                  label: 'Prediksi',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
