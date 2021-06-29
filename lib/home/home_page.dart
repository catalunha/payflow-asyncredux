import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_paid_page_connector.dart';
import 'package:payflow_asyncredux/bill/bill_paid_page.dart';
import 'package:payflow_asyncredux/bill/bill_to_pay_page_connector.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';
import 'package:payflow_asyncredux/theme/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final String userPhotoUrl;
  final String userDisplayName;
  final VoidCallback signOut;

  const HomePage({
    Key? key,
    required this.userPhotoUrl,
    required this.userDisplayName,
    required this.signOut,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      BillToPayPageConnector(),
      BillPaidPageConnector(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 110,
          color: AppColors.primary,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: ListTile(
                  onTap: widget.signOut,
                  title: Text(
                    'Olá ${widget.userDisplayName}',
                    style: AppTextStyles.titleRegular,
                  ),
                  subtitle: Text(
                    'Mantenha suas contas em dia.',
                    style: AppTextStyles.captionShape,
                  ),
                  trailing: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(widget.userPhotoUrl),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  selectedIndex = 0;
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color:
                      selectedIndex == 0 ? AppColors.primary : AppColors.body,
                )),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, '/bill_create_text');
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color:
                      selectedIndex == 1 ? AppColors.primary : AppColors.body,
                ))
          ],
        ),
      ),
    );
  }
}
