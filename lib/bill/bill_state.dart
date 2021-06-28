import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';

class BillState {
  final BillModel? billCurrent;
  final List<BillModel>? billList;
  final List<BillModel>? billFiltered;
  static StreamSubscription<Object>? billStream;
  BillState({
    this.billCurrent,
    this.billList,
    this.billFiltered,
  });
  factory BillState.initialState() => BillState(
        billCurrent: null,
        billList: [],
        billFiltered: [],
      );
  BillState copyWith({
    BillModel? billCurrent,
    List<BillModel>? billList,
    List<BillModel>? billFiltered,
  }) {
    return BillState(
      billCurrent: billCurrent ?? this.billCurrent,
      billList: billList ?? this.billList,
      billFiltered: billFiltered ?? this.billFiltered,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillState &&
        other.billCurrent == billCurrent &&
        listEquals(other.billList, billList) &&
        listEquals(other.billFiltered, billFiltered);
  }

  @override
  int get hashCode =>
      billCurrent.hashCode ^ billList.hashCode ^ billFiltered.hashCode;

  @override
  String toString() =>
      'BillState(billCurrent: $billCurrent, billList: $billList, billFiltered: $billFiltered)';
}
