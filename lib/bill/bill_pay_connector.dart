import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_action.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_pay.dart';

class BillPayConnector extends StatelessWidget {
  // final BillModel billModel;

  const BillPayConnector({
    Key? key,
    // required this.billModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillPayViewModel>(
      vm: () => BillPayFactory(this),
      builder: (context, vm) => BillPay(
        billModel: vm.billModel,
        onPay: vm.onPay,
      ),
    );
  }
}

class BillPayFactory extends VmFactory<AppState, BillPayConnector> {
  BillPayFactory(widget) : super(widget);
  @override
  BillPayViewModel fromStore() => BillPayViewModel(
        onPay: (String id, bool paid) => dispatch(
          UpdateDocBillAction(
            id: id,
            billModel: BillModel('', paid: paid),
          ),
        ),
        billModel: state.billState.billCurrent!,
      );
}

class BillPayViewModel extends Vm {
  final BillModel billModel;
  final Function(String, bool) onPay;
  BillPayViewModel({required this.billModel, required this.onPay})
      : super(equals: []);
}
