// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';

class CustomFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? helperText;

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
    this.inputFormatters,
    this.validator,
    this.helperText,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lavender));

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
            helperMaxLines: 3,
            helperText: _helperText,
            suffixIcon: widget.suffixIcon,
            labelText: widget.labelText.toUpperCase(),
            labelStyle: AppTextStyles.smallText.copyWith(color: AppColors.gray),
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red), // Borda vermelha para erro
            ),
            focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            enabledBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.darkGrey),
            ),
            disabledBorder: defaultBorder),
      ),
    );
  }
}
