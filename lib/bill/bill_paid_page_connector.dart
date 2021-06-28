import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_action.dart';
import 'package:payflow_asyncredux/bill/bill_paid_page.dart';

class BillPaidPageConnector extends StatelessWidget {
  const BillPaidPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillPaidViewModel>(
      vm: () => BillPaidFactory(this),
      builder: (context, vm) => BillPaidPage(
        onClick: vm.onClick,
        info: 'teste',
      ),
    );
  }
}

class BillPaidFactory extends VmFactory<AppState, BillPaidPageConnector> {
  BillPaidFactory(widget) : super(widget);
  @override
  BillPaidViewModel fromStore() => BillPaidViewModel(
        onClick: () => dispatch(CancelStreamBillAction()),
      );
}

class BillPaidViewModel extends Vm {
  final VoidCallback onClick;

  BillPaidViewModel({required this.onClick}) : super(equals: []);
}