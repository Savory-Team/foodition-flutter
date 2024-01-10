import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

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
    labelAddressController = TextEditingController(text: 'Rumah');
    countryController = TextEditingController(text: 'Indonesia');
    provinceController = TextEditingController(text: 'Jawa Timur');
    cityController = TextEditingController(text: 'Jember');
    subdistrictController = TextEditingController(text: 'Kaliwates');
    villageController = TextEditingController(text: 'Mangli');
    addressController = TextEditingController(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore...');
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Alamat'),
      ),
      body: ListView(
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
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Provinsi'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomDropdown(
            value: provinceController.text,
            items: const ['DKI Jakarta', 'Jawa Timur'],
            label: 'Provinsi',
            onChanged: (value) {
              provinceController.text = value!;
            },
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Kota/Kabupaten'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomDropdown(
            value: cityController.text,
            items: const ['Jakarta Selatan', 'Jakarta Pusat', 'Jember'],
            label: 'Kota/Kabupaten',
            onChanged: (value) {
              cityController.text = value!;
            },
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Kecamatan'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomDropdown(
            value: subdistrictController.text,
            items: const ['Menteng', 'Kaliwates'],
            label: 'Kecamatan',
            onChanged: (value) {
              subdistrictController.text = value!;
            },
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Kelurahan/Desa'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomDropdown(
            value: villageController.text,
            items: const ['Cikini', 'Mangli'],
            label: 'Kelurahan/Desa',
            onChanged: (value) {
              villageController.text = value!;
            },
          ),
          const SpaceHeight(AppDimens.spacing24pt),
          const CustomText.h4('Alamat Lengkap'),
          const SpaceHeight(AppDimens.spacing8pt),
          CustomTextField(
            controller: countryController,
            label: 'Alamat Lengkap',
            onChanged: (value) {},
          ),
        ],
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
