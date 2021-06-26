import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_images.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset(AppImages.google)),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'Entrar com Goole',
                  style: AppTextStyles.buttonBoldGrey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
