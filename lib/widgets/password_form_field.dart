import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormFild extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const PasswordFormFild({
    super.key,
    this.padding,
    this.hintText,
    required this.labelText,
    this.textCapitalization,
    this.controller,
    this.textInputType,
  });

  @override
  State<PasswordFormFild> createState() => _PasswordFormFild();
}

class _PasswordFormFild extends State<PasswordFormFild> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lavender));

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      obscureText: isHidden,
      labelText: 'password',
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      suffixIcon: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(28)),
        child: isHidden
            ? const Icon(Icons.visibility_off) // Ícone para quando está oculto
            : const Icon(Icons.visibility),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
