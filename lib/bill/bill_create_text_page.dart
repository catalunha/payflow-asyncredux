import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:payflow_asyncredux/bill/bill_create_text_page_connector.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';
import 'package:payflow_asyncredux/widget/divider_vertical.dart';
import 'package:payflow_asyncredux/widget/input_date.dart';
import 'package:payflow_asyncredux/widget/input_text.dart';
import 'package:payflow_asyncredux/widget/set_label_buttons.dart';

class BillCreateTextPage extends StatefulWidget {
  final FormController formController;
  final Function(BillModel) onSave;
  final BillModel billModel;

  const BillCreateTextPage(
      {Key? key,
      required this.formController,
      required this.onSave,
      required this.billModel})
      : super(key: key);

  @override
  _BillCreateTextPageState createState() => _BillCreateTextPageState();
}

class _BillCreateTextPageState extends State<BillCreateTextPage> {
  late DateTime date;
  late TimeOfDay time;
  late MoneyMaskedTextController moneyMaskedTextController;
  late MaskedTextController dueDatemaskedTextController;
  late TextEditingController barcodeInputTextController;
  @override
  void initState() {
    date = widget.formController.billModel.payDate ?? DateTime.now();
    time = widget.formController.billModel.payDate == null
        ? TimeOfDay.now()
        : TimeOfDay(hour: date.hour, minute: date.minute);
    moneyMaskedTextController = MoneyMaskedTextController(
        initialValue: widget.billModel.value == null
            ? 0.0
            : (widget.billModel.value! / 100).toDouble(),
        // leftSymbol: 'R\$',
        decimalSeparator: ',');
    // dueDatemaskedTextController = MaskedTextController(
    //     text: widget.billModel.dueDate, mask: '00/00/0000');
    barcodeInputTextController =
        TextEditingController(text: widget.billModel.code);
    super.initState();
  }

  String getTextDate() {
    return '${DateFormat("dd-MM-yyyy").format(date)}';
  }

  String getTextTime() {
    final hours = time.hour.toString().padLeft(2, '0');
    final min = time.minute.toString().padLeft(2, '0');
    return '$hours:$min';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preencha dados do boleto',
          style: AppTextStyles.titleBoldHeading,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: widget.formController.formKey,
          child: Column(
            children: [
              InputText(
                label: 'Nome do boleto',
                initialValue: widget.billModel.name,
                validator: widget.formController.validateName,
                icon: Icons.description_outlined,
                onChanged: (value) {
                  widget.formController.onChange(name: value);
                },
              ),
              InputDate(
                date: widget.formController.billModel.dueDate ?? DateTime.now(),
                onSelectDate: (value) {
                  widget.formController.onChange(
                    dueDate: DateTime(
                      value.year,
                      value.month,
                      value.day,
                    ),
                  );
                },
              ),

              // IconButton(
              //   onPressed: () => pickTimer(context),
              //   icon: Icon(Icons.timer),
              // ),
              // Text(getTextTime()),
              // InputText(
              //   label: 'Vencimento',
              //   controller: dueDatemaskedTextController,
              //   validator: widget.formController.validateVencimento,
              //   icon: Icons.date_range_outlined,
              //   onChanged: (value) {
              //     widget.formController.onChange(dueDate: value);
              //   },
              // ),
              InputText(
                label: 'Valor R\$',
                controller: moneyMaskedTextController,
                validator: (_) => widget.formController.validateValor(int.parse(
                    moneyMaskedTextController.text
                        .replaceAll('.', '')
                        .replaceAll(',', ''))),
                icon: FontAwesomeIcons.moneyBillAlt,
                onChanged: (value) {
                  widget.formController.onChange(
                      value: int.parse(moneyMaskedTextController.text
                          .replaceAll('.', '')
                          .replaceAll(',', '')));
                },
              ),
              InputText(
                label: 'Código',
                controller: barcodeInputTextController,
                validator: widget.formController.validateCodigo,
                icon: FontAwesomeIcons.barcode,
                onChanged: (value) {
                  widget.formController.onChange(code: value);
                },
              ),
              widget.formController.billModel.id.isEmpty
                  ? Container()
                  : CheckboxListTile(
                      title: Text('Arquivar este boleto ?'),
                      value: widget.formController.billModel.isArchived,
                      secondary: Icon(Icons.archive_outlined),
                      activeColor: Colors.green,
                      checkColor: Colors.black,
                      // tristate: true,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          widget.formController.onChange(isArchived: value);
                        });
                      }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        labelOne: 'Cancelar',
        onPressedOne: () {},
        labelTwo: 'Cadastrar',
        onPressedTwo: () {
          widget.formController.cadastrarBoleto();
          if (widget.formController.ifFormValid) {
            widget.onSave(widget.formController.billModel);
            Navigator.pop(context);
          } else {
            print('Form Fields Invalidos');
          }
        },
      ),
    );
  }

  // Future pickDate(BuildContext context) async {
  //   // final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: date,
  //     firstDate: DateTime(DateTime.now().year),
  //     lastDate: DateTime(DateTime.now().year + 1),
  //   );
  //   if (newDate == null) return;
  //   setState(() => date = newDate);
  // }

  Future pickTimer(BuildContext context) async {
    // final initialTime = TimeOfDay(hour: date.hour,minute: date.minute);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (newTime == null) return;
    setState(() => time = newTime);
  }
}
