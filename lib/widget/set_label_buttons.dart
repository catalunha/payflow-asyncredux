import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/widget/divider_vertical.dart';
import 'package:payflow_asyncredux/widget/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String labelOne;
  final VoidCallback onPressedOne;
  final String labelTwo;
  final VoidCallback onPressedTwo;

  const SetLabelButtons({
    Key? key,
    required this.labelOne,
    required this.onPressedOne,
    required this.labelTwo,
    required this.onPressedTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: labelOne,
              onPressed: onPressedOne,
            ),
          ),
          DividerVertical(),
          Expanded(
            child: LabelButton(
              label: labelTwo,
              onPressed: onPressedTwo,
            ),
          ),
        ],
      ),
    );
  }
}
