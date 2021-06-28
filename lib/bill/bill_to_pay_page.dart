import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_info.dart';
import 'package:payflow_asyncredux/bill/bill_list.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';

class BillToPayPage extends StatelessWidget {
  // final List<BillModel> billModelList = [
  //   BillModel(
  //     '1',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '2',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '3',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '4',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '5',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '6',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '7',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  //   BillModel(
  //     '8',
  //     name: 'bbbb',
  //     dueDate: '11/11/1111',
  //     value: '11',
  //     code: '123',
  //     paid: false,
  //   ),
  // ];
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
        // SizedBox(height: 10),
        // Text('Meus boletos', style: AppTextStyles.titleBoldHeading),
        // SizedBox(height: 10),
        // Divider(color: AppColors.stroke),
        Expanded(child: BillList(billModelList: billModelList)),
      ],
    );
  }
}
