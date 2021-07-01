import 'dart:convert';

import 'package:payflow_asyncredux/firestore/firestore_model.dart';

class BillModel extends FirestoreModel {
  static late final String collection = 'bills';

  final String? name;
  final String? dueDate;
  final String? value;
  final String? code;
  final bool? paid;
  final bool? isActive;
  final bool? isArchived;
  BillModel(
    id, {
    this.name,
    this.dueDate,
    this.value,
    this.code,
    this.paid,
    this.isActive = true,
    this.isArchived = false,
  }) : super(id);

  BillModel copyWith({
    String? name,
    String? dueDate,
    String? value,
    String? code,
    bool? paid,
    bool? isActive,
    bool? isArchived,
  }) {
    return BillModel(
      this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      code: code ?? this.code,
      paid: paid ?? this.paid,
      isActive: isActive ?? this.isActive,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (name != null) data['name'] = this.name;
    if (dueDate != null) data['dueDate'] = this.dueDate;
    if (value != null) data['value'] = this.value;
    if (code != null) data['code'] = this.code;
    if (paid != null) data['paid'] = this.paid;
    if (isActive != null) data['isActive'] = this.isActive;
    if (isArchived != null) data['isArchived'] = this.isArchived;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'code': code,
      'paid': paid,
      'isActive': isActive,
      'isArchived': isArchived,
    };
  }

  factory BillModel.fromMap(String id, Map<String, dynamic> map) {
    return BillModel(
      id,
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      code: map['code'],
      paid: map['paid'],
      isActive: map['isActive'] ?? true,
      isArchived: map['isArchived'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String id, String source) =>
      BillModel.fromMap(id, json.decode(source));

  @override
  String toString() {
    return 'BillModel(name: $name, dueDate: $dueDate, value: $value, code: $code, paid: $paid, isActive: $isActive, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.code == code &&
        other.paid == paid &&
        other.isActive == isActive &&
        other.isArchived == isArchived;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        code.hashCode ^
        paid.hashCode ^
        isActive.hashCode ^
        isArchived.hashCode;
  }
}
