import 'dart:convert';

import 'package:payflow_asyncredux/firestore/firestore_model.dart';

class BillModel extends FirestoreModel {
  static late final String collection = 'bills';

  final String? name;
  final String? dueDate;
  final String? value;
  final String? code;
  final bool? paid;

  BillModel(
    String id, {
    this.name,
    this.dueDate,
    this.value,
    this.code,
    this.paid,
  }) : super(id);

  factory BillModel.fromMap(String id, Map<String, dynamic> map) {
    return BillModel(
      id,
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      code: map['code'],
      paid: map['paid'],
    );
  }

  factory BillModel.fromJson(String id, String source) =>
      BillModel.fromMap(id, json.decode(source));

  BillModel copyWith({
    String? name,
    String? dueDate,
    String? value,
    String? code,
    bool? paid,
  }) {
    return BillModel(
      this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      code: code ?? this.code,
      paid: paid ?? this.paid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'code': code,
      'paid': paid,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'BillModel(name: $id,name: $name, dueDate: $dueDate, value: $value, code: $code, paid: $paid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.code == code &&
        other.paid == paid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        code.hashCode ^
        paid.hashCode;
  }
}
