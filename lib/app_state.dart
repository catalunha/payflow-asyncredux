import 'package:async_redux/async_redux.dart';

import 'package:payflow_asyncredux/bill/bill_state.dart';
import 'package:payflow_asyncredux/login/login_state.dart';
import 'package:payflow_asyncredux/upload/upload_state.dart';
import 'package:payflow_asyncredux/user/user_state.dart';

class AppState {
  final Wait wait;
  final LoginState loginState;
  final UserState userState;
  final BillState billState;
  final UploadState uploadState;
  AppState({
    required this.wait,
    required this.loginState,
    required this.userState,
    required this.billState,
    required this.uploadState,
  });

  static AppState initialState() => AppState(
        wait: Wait(),
        loginState: LoginState.initialState(),
        userState: UserState.initialState(),
        billState: BillState.initialState(),
        uploadState: UploadState.initialState(),
      );
  AppState copyWith({
    Wait? wait,
    LoginState? loginState,
    UserState? userState,
    BillState? billState,
    UploadState? uploadState,
  }) {
    return AppState(
      wait: wait ?? this.wait,
      loginState: loginState ?? this.loginState,
      userState: userState ?? this.userState,
      billState: billState ?? this.billState,
      uploadState: uploadState ?? this.uploadState,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.wait == wait &&
        other.uploadState == uploadState &&
        other.loginState == loginState &&
        other.userState == userState &&
        other.billState == billState;
  }

  @override
  int get hashCode {
    return wait.hashCode ^
        uploadState.hashCode ^
        loginState.hashCode ^
        userState.hashCode ^
        billState.hashCode;
  }
}
