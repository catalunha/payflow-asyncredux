import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/routes.dart';
import 'package:payflow_asyncredux/theme/app_colors.dart';

late Store<AppState> store;
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Intl.defaultLocale = 'pt_BR';
  // initializeDateFormatting();

  store = Store<AppState>(initialState: AppState.initialState());
  NavigateAction.setNavigatorKey(navigatorKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'payFlow-AsyncRedux',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: Colors.orange,
        ),
        navigatorKey: navigatorKey,
        routes: Routes.routes,
        initialRoute: '/',
      ),
    );
  }
}
