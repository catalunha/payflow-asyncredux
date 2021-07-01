import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';

class BillPay extends StatelessWidget {
  final BillModel billModel;
  final Function(String, bool) onPay;

  const BillPay({
    Key? key,
    required this.billModel,
    required this.onPay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(
          child: billModel.isPaid!
              ? Text('Boleto não foi pago ? Estornar ?')
              : Text('Pagar este boleto ?')),
      children: [
        ListTile(
          leading: Icon(Icons.description_outlined),
          // title: Text('Nome'),
          title: Text(billModel.name!),
        ),
        ListTile(
          leading: Icon(Icons.date_range_outlined),
          // title: Text('Vencimento'),
          title: Text(DateFormat('dd-MM-yyyy').format(billModel.dueDate!)),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.moneyBillAlt),
          // title: Text('Valor'),
          title: Text((billModel.value! / 100).toStringAsFixed(2)),
        ),
        ListTile(
          leading: Icon(FontAwesomeIcons.barcode),
          // title: Text('Código'),
          title: Text(billModel.code!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SimpleDialogOption(
                child: Text('Sim'),
                onPressed: () {
                  onPay(billModel.id, !billModel.isPaid!);
                  Navigator.pop(context, true);
                },
              ),
            ),
            SimpleDialogOption(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        ),
      ],
    );
  }
}
