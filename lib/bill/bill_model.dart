import 'dart:convert';

import 'package:payflow_asyncredux/firestore/firestore_model.dart';

class BillModel extends FirestoreModel {
  static late final String collection = 'bills';

  final String? name;
  final DateTime? dueDate;
  final DateTime? payDate;
  final int? value;
  final String? code;
  final bool? isPaid;
  final bool? isActive;
  final bool? isArchived;
  BillModel(
    id, {
    this.name,
    this.dueDate,
    this.payDate,
    this.value,
    this.code,
    this.isPaid,
    this.isActive = true,
    this.isArchived = false,
  }) : super(id);

  BillModel copyWith({
    String? name,
    DateTime? dueDate,
    DateTime? payDate,
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
      payDate: payDate ?? this.payDate,
      value: value ?? this.value,
      code: code ?? this.code,
      isPaid: isPaid ?? this.isPaid,
      isActive: isActive ?? this.isActive,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toData() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (name != null) data['name'] = this.name;
    if (dueDate != null) data['dueDate'] = this.dueDate;
    if (payDate != null) data['payDate'] = this.payDate;
    if (value != null) data['value'] = this.value;
    if (code != null) data['code'] = this.code;
    if (isPaid != null) data['isPaid'] = this.isPaid;
    if (isActive != null) data['isActive'] = this.isActive;
    if (isArchived != null) data['isArchived'] = this.isArchived;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'payDate': payDate,
      'value': value,
      'code': code,
      'isPaid': isPaid,
      'isActive': isActive,
      'isArchived': isArchived,
    };
  }

  factory BillModel.fromMap(String id, Map<String, dynamic> map) {
    print(
        '${map['name']} dueDate.fromMi ${DateTime.fromMillisecondsSinceEpoch(map['dueDate'].millisecondsSinceEpoch)}');
    print('${map['name']} dueDate.toDate() ${map['dueDate'].toDate()}');
    return BillModel(
      id,
      name: map['name'],
      dueDate:
          map['dueDate'] == null ? DateTime.now() : map['dueDate'].toDate(),
      payDate:
          map['payDate'] == null ? DateTime.now() : map['payDate'].toDate(),
      value: map['value'],
      code: map['code'],
      isPaid: map['isPaid'],
      isActive: map['isActive'] ?? true,
      isArchived: map['isArchived'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String id, String source) =>
      BillModel.fromMap(id, json.decode(source));

  @override
  String toString() {
    return 'BillModel(name: $name, dueDate: $dueDate, payDate: $payDate, value: $value, code: $code, isPaid: $isPaid, isActive: $isActive, isArchived: $isArchived)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.payDate == payDate &&
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
        payDate.hashCode ^
        value.hashCode ^
        code.hashCode ^
        isPaid.hashCode ^
        isActive.hashCode ^
        isArchived.hashCode;
  }

  // factory BillModel.fromMap(Map<String, dynamic> map) {
  //   return BillModel(
  //     map['name'],
  //     map['dueDate'],
  //     DateTime.fromMillisecondsSinceEpoch(map['payDate']),
  //     map['value'],
  //     map['code'],
  //     map['isPaid'],
  //     map['isActive'],
  //     map['isArchived'],
  //   );
  // }

}
