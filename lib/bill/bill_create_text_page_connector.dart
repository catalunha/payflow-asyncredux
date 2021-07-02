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
        billModel: vm.billModel,
      ),
    );
  }
}

class BillInsertTextFactory
    extends VmFactory<AppState, BillCreateTextPageConnector> {
  BillInsertTextFactory(widget) : super(widget);
  @override
  BillInsertTextViewModel fromStore() => BillInsertTextViewModel(
        formController: FormController(billModel: state.billState.billCurrent!),
        onSave: (BillModel billModel) {
          print('${billModel.toString()}');
          print('${billModel.toMap()}');
          print('${billModel.toData()}');
          // dispatch(AddPayBillAction(billModel: billModel));
          if (billModel.id.isNotEmpty) {
            dispatch(
              UpdateDocBillAction(
                id: billModel.id,
                billModel: billModel,
              ),
            );
          } else {
            dispatch(
              CreateDocBillAction(
                billModel: billModel.copyWith(isPaid: false),
              ),
            );
          }
        },
        billModel: state.billState.billCurrent ??
            BillModel('', name: '', value: 0, dueDate: DateTime.now()),
      );
}

class BillInsertTextViewModel extends Vm {
  final FormController formController;
  final Function(BillModel) onSave;
  final BillModel billModel;

  BillInsertTextViewModel({
    required this.formController,
    required this.onSave,
    required this.billModel,
  }) : super(equals: [formController, billModel]);
}

class FormController {
  // final String? billModelCurrent;
  final formKey = GlobalKey<FormState>();
  bool ifFormValid = false;
  BillModel billModel;

  FormController({required this.billModel});
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(int value) =>
      value <= 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({
    String? name,
    DateTime? dueDate,
    int? value,
    String? code,
    bool? isArchived,
    DateTime? payDate,
  }) {
    billModel = billModel.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      code: code,
      isArchived: isArchived,
    );
    print('--> FormController.onChange(): $billModel');
  }

  void cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      ifFormValid = true;
    }
  }
}
