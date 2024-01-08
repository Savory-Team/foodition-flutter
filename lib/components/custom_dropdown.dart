import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/constants/dimens.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String label;
  final Function(String? value)? onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12pt,
          borderSide: BorderSide(color: AppColors.stroke),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorderRadius.radius12pt,
          borderSide: BorderSide(color: AppColors.stroke),
        ),
      ),
    );
  }
}
