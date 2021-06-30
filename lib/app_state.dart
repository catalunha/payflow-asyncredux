import 'package:async_redux/async_redux.dart';

import 'package:payflow_asyncredux/bill/bill_state.dart';
import 'package:payflow_asyncredux/login/login_state.dart';
import 'package:payflow_asyncredux/user/user_State.dart';

class AppState {
  final Wait wait;
  final LoginState loginState;
  final UserState userState;
  final BillState billState;
  AppState({
    required this.wait,
    required this.loginState,
    required this.userState,
    required this.billState,
  });

  static AppState initialState() => AppState(
        wait: Wait(),
        loginState: LoginState.initialState(),
        userState: UserState.initialState(),
        billState: BillState.initialState(),
      );
  AppState copyWith({
    Wait? wait,
    LoginState? loginState,
    UserState? userState,
    BillState? billState,
  }) {
    return AppState(
      wait: wait ?? this.wait,
      loginState: loginState ?? this.loginState,
      userState: userState ?? this.userState,
      billState: billState ?? this.billState,
    );
  }

  @override
  String toString() {
    return 'AppState(wait: $wait, loginState: $loginState, userState: $userState, billState: $billState)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.wait == wait &&
        other.loginState == loginState &&
        other.userState == userState &&
        other.billState == billState;
  }

  @override
  int get hashCode {
    return wait.hashCode ^
        loginState.hashCode ^
        userState.hashCode ^
        billState.hashCode;
  }
}
