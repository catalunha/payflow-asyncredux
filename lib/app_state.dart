import 'package:async_redux/async_redux.dart';
import 'package:payflow_asyncredux/login/login_state.dart';
import 'package:payflow_asyncredux/user/userState.dart';

class AppState {
  final Wait wait;
  final LoginState loginState;
  final UserState userState;

  AppState({
    required this.userState,
    required this.loginState,
    required this.wait,
  });

  static AppState initialState() => AppState(
        wait: Wait(),
        loginState: LoginState.initialState(),
        userState: UserState.initialState(),
      );

  AppState copy({
    Wait? wait,
    LoginState? loginState,
    UserState? userState,
  }) =>
      AppState(
        userState: userState ?? this.userState,
        loginState: loginState ?? this.loginState,
        wait: wait ?? this.wait,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppState &&
        wait == other.wait &&
        userState == other.userState &&
        loginState == other.loginState &&
        runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => wait.hashCode ^ loginState.hashCode ^ userState.hashCode;
}
