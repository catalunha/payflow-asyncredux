import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_list.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class BillPaidPage extends StatelessWidget {
  final String info;
  final VoidCallback onClick;

  final List<BillModel> billModelList = [
    BillModel(
      '1',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '2',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '3',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '4',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '5',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '6',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '7',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
    BillModel(
      '8',
      name: 'bbbb',
      dueDate: '11/11/1111',
      value: '11',
      code: '123',
      paid: true,
    ),
  ];
  // final List<BillModel> billModelList;

  BillPaidPage({Key? key, required this.info, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text('Meus boletos pagoss $info',
            style: AppTextStyles.titleBoldHeading),
        // SizedBox(height: 10),
        Divider(color: AppColors.stroke),
        Expanded(child: BillList(billModelList: billModelList)),
        IconButton(onPressed: onClick, icon: Icon(Icons.check))
      ],
    );
  }
}
