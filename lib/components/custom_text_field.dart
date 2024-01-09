import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final Widget? prefix;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.icon,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: icon == null ? null : Icon(icon, color: AppColors.grey),
          prefix: prefix,
          border: const OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12pt,
            borderSide: BorderSide(color: AppColors.stroke),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: AppBorderRadius.radius12pt,
            borderSide: BorderSide(color: AppColors.stroke),
          ),
          hintText: label,
          hintStyle: const TextStyle(color: AppColors.hint),
        ),
      ),
    );
  }
}
