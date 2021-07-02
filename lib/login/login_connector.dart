import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/login/login_action.dart';
import 'package:payflow_asyncredux/login/login_page.dart';

class LoginConnector extends StatelessWidget {
  const LoginConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      vm: () => LoginViewModelFactory(this),
      builder: (context, vm) => LoginPage(
        signIn: vm.signIn,
      ),
    );
  }
}

class LoginViewModelFactory extends VmFactory<AppState, LoginConnector> {
  LoginViewModelFactory(widget) : super(widget);
  @override
  LoginViewModel fromStore() => LoginViewModel(
        signIn: () => dispatch(SignInLoginAction()),
      );
}

class LoginViewModel extends Vm {
  final VoidCallback signIn;

  LoginViewModel({
    required this.signIn,
  }) : super(equals: []);
}
