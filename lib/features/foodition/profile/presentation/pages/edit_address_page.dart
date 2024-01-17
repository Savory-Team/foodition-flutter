import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/core.dart';
import '../../data/models/request/requests.dart';
import '../../domain/models/address_model.dart';
import '../managers/resto/resto_bloc.dart';
import '../managers/user/user_bloc.dart';

class EditAddressPage extends StatefulWidget {
  final AddressModel data;
  const EditAddressPage(this.data, {super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late final TextEditingController labelAddressController;
  late final TextEditingController countryController;
  late final TextEditingController provinceController;
  late final TextEditingController cityController;
  late final TextEditingController subdistrictController;
  late final TextEditingController villageController;
  late final TextEditingController addressController;

  @override
  void initState() {
    labelAddressController =
        TextEditingController(text: widget.data.labelAddress);
    countryController = TextEditingController(text: 'Indonesia');
    provinceController = TextEditingController(text: widget.data.province);
    cityController = TextEditingController(text: widget.data.city);
    subdistrictController =
        TextEditingController(text: widget.data.subdistrict);
    villageController = TextEditingController(text: widget.data.village);
    addressController = TextEditingController(text: widget.data.address);
    super.initState();
  }

  @override
  void dispose() {
    labelAddressController.dispose();
    countryController.dispose();
    provinceController.dispose();
    cityController.dispose();
    subdistrictController.dispose();
    villageController.dispose();
    addressController.dispose();
    super.dispose();
    context.dismissLoadingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Alamat'),
      ),
      body: BlocListener<RestoBloc, RestoState>(
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
        child: BlocListener<UserBloc, UserState>(
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
              const CustomText.h4('Label Alamat'),
              const SpaceHeight(AppDimens.spacing8pt),
              CustomTextField(
                controller: labelAddressController,
                label: 'Label Alamat',
                onChanged: (value) {},
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Negara'),
              const SpaceHeight(AppDimens.spacing8pt),
              CustomTextField(
                controller: countryController,
                label: 'Negara',
                onChanged: (value) {},
                readOnly: true,
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Provinsi'),
              const SpaceHeight(AppDimens.spacing8pt),
              // CustomDropdown(
              //   value: provinceController.text,
              //   items: const ['DKI Jakarta', 'Jawa Timur'],
              //   label: 'Provinsi',
              //   onChanged: (value) {
              //     provinceController.text = value!;
              //   },
              // ),
              CustomTextField(
                controller: provinceController,
                label: 'Provinsi',
                onChanged: (value) {},
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Kota/Kabupaten'),
              const SpaceHeight(AppDimens.spacing8pt),
              // CustomDropdown(
              //   value: cityController.text,
              //   items: const ['Jakarta Selatan', 'Jakarta Pusat', 'Jember'],
              //   label: 'Kota/Kabupaten',
              //   onChanged: (value) {
              //     cityController.text = value!;
              //   },
              // ),
              CustomTextField(
                controller: cityController,
                label: 'Kota/Kabupaten',
                onChanged: (value) {},
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Kecamatan'),
              const SpaceHeight(AppDimens.spacing8pt),
              // CustomDropdown(
              //   value: subdistrictController.text,
              //   items: const ['Menteng', 'Kaliwates'],
              //   label: 'Kecamatan',
              //   onChanged: (value) {
              //     subdistrictController.text = value!;
              //   },
              // ),
              CustomTextField(
                controller: subdistrictController,
                label: 'Kecamatan',
                onChanged: (value) {},
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Kelurahan/Desa'),
              const SpaceHeight(AppDimens.spacing8pt),
              // CustomDropdown(
              //   value: villageController.text,
              //   items: const ['Cikini', 'Mangli'],
              //   label: 'Kelurahan/Desa',
              //   onChanged: (value) {
              //     villageController.text = value!;
              //   },
              // ),
              CustomTextField(
                controller: villageController,
                label: 'Kelurahan/Desa',
                onChanged: (value) {},
              ),
              const SpaceHeight(AppDimens.spacing24pt),
              const CustomText.h4('Alamat Lengkap'),
              const SpaceHeight(AppDimens.spacing8pt),
              CustomTextField(
                controller: addressController,
                label: 'Alamat Lengkap',
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingAll.spacing20pt,
        child: Button.filled(
          disabled: false,
          onPressed: () {
            if (widget.data.isResto) {
              context
                  .read<RestoBloc>()
                  .add(RestoEvent.editAddress(AddressRequest(
                    labelAddress: labelAddressController.text,
                    country: countryController.text,
                    province: provinceController.text,
                    city: cityController.text,
                    subdistrict: subdistrictController.text,
                    village: villageController.text,
                    address: addressController.text,
                  )));
            } else {
              context.read<UserBloc>().add(UserEvent.editAddress(AddressRequest(
                    labelAddress: labelAddressController.text,
                    country: countryController.text,
                    province: provinceController.text,
                    city: cityController.text,
                    subdistrict: subdistrictController.text,
                    village: villageController.text,
                    address: addressController.text,
                  )));
            }
          },
          label: 'Simpan',
        ),
      ),
    );
  }
}
