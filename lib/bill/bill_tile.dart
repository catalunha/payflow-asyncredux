import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class BillTile extends StatelessWidget {
  final BillModel billModel;
  const BillTile({
    Key? key,
    required this.billModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${billModel.name}',
        style: AppTextStyles.titleListTile,
      ),
      subtitle: Text(
        'Vence em ${billModel.dueDate}',
        style: AppTextStyles.captionBody,
      ),
      trailing: Text.rich(
        TextSpan(
          text: "R\$ ",
          style: AppTextStyles.trailingRegular,
          children: [
            TextSpan(
              text: "${billModel.value}",
              style: AppTextStyles.trailingBold,
            ),
          ],
        ),
      ),
    );
  }
}
