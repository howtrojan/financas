import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomFormField({
    super.key,
    this.padding,
    this.hintText,
    required this.labelText,
    this.textCapitalization,
    this.controller,
    this.textInputType,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lavender));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
            labelText: widget.labelText.toUpperCase(),
            labelStyle: AppTextStyles.smallText.copyWith(color: AppColors.gray),
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.greenLightOne),
            ),
            enabledBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.darkGrey),
            ),
            disabledBorder: defaultBorder),
      ),
    );
  }
}
