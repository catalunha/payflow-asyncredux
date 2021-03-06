import 'dart:convert';

import 'package:payflow_asyncredux/firestore/firestore_model.dart';

class BillModel extends FirestoreModel {
  static late final String collection = 'bills';

  final String name;
  final DateTime dueDate;
  final int value;
  final String? code;
  final bool isPaid;
  final bool isActive;
  final bool isArchived;
  BillModel(
    id, {
    required this.name,
    required this.dueDate,
    required this.value,
    this.code,
    this.isPaid = false,
    this.isActive = true,
    this.isArchived = false,
  }) : super(id);

  BillModel copyWith({
    String? name,
    DateTime? dueDate,
    int? value,
    String? code,
    bool? isPaid,
    bool? isActive,
    bool? isArchived,
  }) {
    return BillModel(
      this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      code: code ?? this.code,
      isPaid: isPaid ?? this.isPaid,
      isActive: isActive ?? this.isActive,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['dueDate'] = this.dueDate;
    data['value'] = this.value;
    if (code != null) data['code'] = this.code;
    data['isPaid'] = this.isPaid;
    data['isActive'] = this.isActive;
    data['isArchived'] = this.isArchived;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'code': code,
      'isPaid': isPaid,
      'isActive': isActive,
      'isArchived': isArchived,
    };
  }

  factory BillModel.fromMap(String id, Map<String, dynamic> map) {
    return BillModel(
      id,
      name: map['name'],
      dueDate: map['dueDate'].toDate(),
      value: map['value'],
      code: map['code'],
      isPaid: map['isPaid'],
      isActive: map['isActive'],
      isArchived: map['isArchived'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String id, String source) =>
      BillModel.fromMap(id, json.decode(source));

  @override
  String toString() {
    return 'BillModel(name: $name, dueDate: $dueDate,  value: $value, code: $code, isPaid: $isPaid, isActive: $isActive, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.code == code &&
        other.isPaid == isPaid &&
        other.isActive == isActive &&
        other.isArchived == isArchived;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        code.hashCode ^
        isPaid.hashCode ^
        isActive.hashCode ^
        isArchived.hashCode;
  }
}
