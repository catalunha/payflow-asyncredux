import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_action.dart';
import 'package:payflow_asyncredux/bill/bill_create_text_page.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';

class BillCreateTextPageConnector extends StatelessWidget {
  const BillCreateTextPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BillInsertTextViewModel>(
      vm: () => BillInsertTextFactory(this),
      builder: (context, vm) => BillCreateTextPage(
        formController: vm.formController,
        onSave: vm.onSave,
      ),
    );
  }
}

class BillInsertTextFactory
    extends VmFactory<AppState, BillCreateTextPageConnector> {
  BillInsertTextFactory(widget) : super(widget);
  @override
  BillInsertTextViewModel fromStore() => BillInsertTextViewModel(
      formController: FormController(),
      onSave: (BillModel billModel) {
        print('${billModel.toString()}');
        dispatch(AddPayBillAction(billModel: billModel));
      });
}

class BillInsertTextViewModel extends Vm {
  final FormController formController;
  final Function(BillModel) onSave;
  BillInsertTextViewModel({
    required this.formController,
    required this.onSave,
  }) : super(equals: [formController]);
}

class FormController {
  final formKey = GlobalKey<FormState>();
  bool ifFormValid = false;
  BillModel billModel = BillModel('');
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({
    String? name,
    String? dueDate,
    String? value,
    String? code,
  }) {
    print(name);
    print(dueDate);
    billModel = billModel.copyWith(
        name: name, dueDate: dueDate, value: value, code: code);
    print(billModel);
  }

  void cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      ifFormValid = true;
    }
  }
}