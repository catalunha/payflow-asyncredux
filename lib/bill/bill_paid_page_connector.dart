import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_action.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_paid_page.dart';
import 'package:payflow_asyncredux/bill/bill_state.dart';

class BillPaidPageConnector extends StatelessWidget {
  const BillPaidPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillPaidViewModel>(
      vm: () => BillPaidFactory(this),
      builder: (context, vm) => BillPaidPage(
        onCancelStream: vm.onCancelStream,
        info: 'teste',
        billModelList: vm.billModelList,
      ),
    );
  }
}

class BillPaidFactory extends VmFactory<AppState, BillPaidPageConnector> {
  BillPaidFactory(widget) : super(widget);
  @override
  BillPaidViewModel fromStore() => BillPaidViewModel(
        onCancelStream: () => dispatch(StreamCancelBillAction()),
        billModelList: BillState.selectPaidBills(state),
      );
}

class BillPaidViewModel extends Vm {
  final VoidCallback onCancelStream;
  final List<BillModel> billModelList;

  BillPaidViewModel({
    required this.billModelList,
    required this.onCancelStream,
  }) : super(equals: [
          billModelList,
        ]);
}
