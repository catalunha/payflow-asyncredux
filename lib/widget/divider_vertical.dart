import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';

class DividerVertical extends StatelessWidget {
  final double height;
  const DividerVertical({Key? key, this.height = double.maxFinite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: AppColors.stroke,
    );
  }
}
