import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_tile_connector.dart';

class BillList extends StatelessWidget {
  final List<BillModel> billModelList;
  BillList({Key? key, required this.billModelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children:
            billModelList.map((e) => BillTileConnector(billModel: e)).toList(),
      ),
    );
  }
}
