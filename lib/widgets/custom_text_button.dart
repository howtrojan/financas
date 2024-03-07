import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final List<Text> children;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.children,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children),
    );
  }
}
