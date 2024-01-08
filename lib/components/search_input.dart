import 'package:flutter/material.dart';

import '../core/core.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final bool autofocus;

  const SearchInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.radius12pt,
      ),
      child: TextFormField(
        autofocus: autofocus,
        onTap: onTap,
        readOnly: onTap != null,
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.hint,
          ),
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12pt,
            borderSide: BorderSide(color: AppColors.stroke),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12pt,
            borderSide: BorderSide(color: AppColors.stroke),
          ),
          hintText: 'Cari di Foodition',
          hintStyle: TextStyle(color: AppColors.hint),
        ),
      ),
    );
  }
}