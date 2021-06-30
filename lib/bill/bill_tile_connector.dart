import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_action.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_tile.dart';

class BillTileConnector extends StatelessWidget {
  final BillModel billModel;

  const BillTileConnector({Key? key, required this.billModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillTileViewModel>(
      vm: () => BillTileFactory(this),
      builder: (context, vm) => BillTile(
        billModel: billModel,
        onBillSetCurrent: vm.onBillSetCurrent,
      ),
    );
  }
}

class BillTileFactory extends VmFactory<AppState, BillTileConnector> {
  BillTileFactory(widget) : super(widget);
  @override
  BillTileViewModel fromStore() => BillTileViewModel(
        onBillSetCurrent: (String id) async {
          await dispatch(SetBillCurrentBillAction(id: id));
          return true;
        },
      );
}

class BillTileViewModel extends Vm {
  final Function(String) onBillSetCurrent;

  BillTileViewModel({required this.onBillSetCurrent}) : super(equals: []);
}
