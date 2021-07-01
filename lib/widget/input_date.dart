import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/widget/divider_vertical.dart';

class InputDate extends StatefulWidget {
  DateTime date;
  Function(DateTime) onSelectDate;

  InputDate({
    Key? key,
    required this.date,
    required this.onSelectDate,
  }) : super(key: key);

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  @override
  void initState() {
    super.initState();
  }

  String getTextDate() {
    return '${DateFormat("dd-MM-yyyy").format(widget.date)}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Data de vencimento"),
        Container(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                // child: IconButton(
                //   onPressed: () => pickDate(context),
                //   icon: Icon(Icons.date_range),
                // ),

                child: Icon(
                  Icons.date_range,
                  color: AppColors.primary,
                ),
              ),
              DividerVertical(
                height: 48,
              ),
              SizedBox(width: 15),
              InkWell(
                onTap: () => pickDate(context),
                child: Text(
                  getTextDate(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.stroke,
        ),
      ],
    );
  }

  Future pickDate(BuildContext context) async {
    // final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (newDate == null) return;
    setState(() {
      widget.date = newDate;
      widget.onSelectDate(newDate);
    });
  }
}
