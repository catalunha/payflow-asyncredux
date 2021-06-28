import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_images.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';
import 'package:payflow_asyncredux/widget/divider_vertical.dart';

class BoletoInfo extends StatelessWidget {
  final int quantity;
  const BoletoInfo({Key? key, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logomini),
            SizedBox(width: 10),
            DividerVertical(
              height: 32,
            ),
            SizedBox(width: 10),
            Text.rich(TextSpan(
              text: "Você tem ",
              style: AppTextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$quantity boletos\n",
                  style: AppTextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: AppTextStyles.captionBackground,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
