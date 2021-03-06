import 'package:flutter/material.dart';
import 'package:payflow_asyncredux/bill/bill_create_text_page_connector.dart';
import 'package:payflow_asyncredux/home/home_page_connector.dart';
import 'package:payflow_asyncredux/login/login_connector.dart';
import 'package:payflow_asyncredux/splash/splash_connector.dart';

class Routes {
  static final routes = {
    '/': (BuildContext context) => SplashConnector(),
    '/login': (BuildContext context) => LoginConnector(),
    '/home': (BuildContext context) => HomePageConnector(),
    '/bill_create_text': (BuildContext context) =>
        BillCreateTextPageConnector(),
  };
}
