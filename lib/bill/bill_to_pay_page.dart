import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_info.dart';
import 'package:payflow_asyncredux/bill/bill_list.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';

class BillToPayPage extends StatelessWidget {
  final List<BillModel> billModelList;

  BillToPayPage({Key? key, required this.billModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BillToPayPageUI.build');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: 20,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BoletoInfo(quantity: billModelList.length),
            )
          ],
        ),
        Expanded(child: BillList(billModelList: billModelList)),
      ],
    );
  }
}
