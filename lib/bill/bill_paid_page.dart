import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_list.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class BillPaidPage extends StatelessWidget {
  final String info;
  final VoidCallback onClick;
  final List<BillModel> billModelList;

  BillPaidPage({
    Key? key,
    required this.info,
    required this.onClick,
    required this.billModelList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text('Meus boletos pagos', style: AppTextStyles.titleBoldHeading),
        Divider(color: AppColors.stroke),
        Expanded(child: BillList(billModelList: billModelList)),
      ],
    );
  }
}
