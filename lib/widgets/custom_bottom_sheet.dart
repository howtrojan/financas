import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/app_text_styles.dart';
import 'package:financas/widgets/primary_button.dart';
import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context, String content) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38), topRight: Radius.circular(38))),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
            color: AppColors.lavender,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38), topRight: Radius.circular(38))),
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content,
                style: AppTextStyles.buttonText,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              PrimaryButton(
                text: 'Tentar Novamente',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
