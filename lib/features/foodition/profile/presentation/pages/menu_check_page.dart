import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../../core/core.dart';
import '../../../home/domain/models/prediction_result.dart';
import '../../../home/presentation/managers/ml/ml_bloc.dart';

class MenuCheckPage extends StatefulWidget {
  const MenuCheckPage({super.key});

  @override
  State<MenuCheckPage> createState() => _MenuCheckPageState();
}

class _MenuCheckPageState extends State<MenuCheckPage> {
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
            onPressed: () {
              if (data.status.isEdible) {
                context.pushReplacementNamed(
                  FooditionRouter.addMenu,
                  extra: File(xFile!.path),
                );
              } else {
                context.pop();
              }
              xFile = null;
              setState(() {});
            },
            child: const CustomText.h3('OK'),
          ),
        ],
      ),
    );
  }

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
              onPressed: () {
                context
                    .read<MlBloc>()
                    .add(MlEvent.predict(file: File(xFile!.path)));
              },
              label: 'Lanjutkan',
            ),
          ),
        ),
      ),
    );
  }
}
