import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:payflow_asyncredux/bill/bill_create_text_page_connector.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_pay_connector.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class BillTile extends StatelessWidget {
  final BillModel billModel;
  final Function(String) onBillSetCurrent;

  const BillTile({
    Key? key,
    required this.billModel,
    required this.onBillSetCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        onBillSetCurrent(billModel.id);
        await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return BillPayConnector();
            });
      },
      onLongPress: () async {
        onBillSetCurrent(billModel.id);
        await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return BillCreateTextPageConnector();
            });
      },
      title: Text(
        '${billModel.name}',
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        // 'Vence em ${billModel.dueDate}',
        // 'Vence em ${billModel.payDate!}',
        'Vence em ${DateFormat('dd-MM-yyyy').format(billModel.dueDate!)}',
        style: AppTextStyles.captionBody,
      ),
      trailing: Text.rich(
        TextSpan(
          text: "R\$ ",
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
              text:
                  '${MoneyMaskedTextController(initialValue: (billModel.value! / 100).toDouble(), decimalSeparator: ",").text}',
              style: AppTextStyles.trailingBold,
            ),
          ],
        ),
      ),
    );
  }
}
