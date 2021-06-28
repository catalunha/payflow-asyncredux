import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_to_pay_page.dart';

class BillToPayPageConnector extends StatelessWidget {
  const BillToPayPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillToPayViewModel>(
      vm: () => BillToPayFactory(this),
      builder: (context, vm) => BillToPayPage(
        billModelList: vm.billModelList,
      ),
    );
  }
}

class BillToPayFactory extends VmFactory<AppState, BillToPayPageConnector> {
  BillToPayFactory(widget) : super(widget);
  @override
  BillToPayViewModel fromStore() => BillToPayViewModel(
        billModelList: state.billState.billList!,
      );
}

class BillToPayViewModel extends Vm {
  final List<BillModel> billModelList;

  BillToPayViewModel({required this.billModelList})
      : super(equals: [
          billModelList,
        ]);
}
