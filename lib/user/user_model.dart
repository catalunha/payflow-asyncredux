import 'package:payflow_asyncredux/firestore/firestore_model.dart';

class UserModel extends FirestoreModel {
  static final String collection = 'users';
  String? info;
  UserModel(
    String id, {
    this.info,
  }) : super(id);

  @override
  UserModel fromMap(Map<String, dynamic> map) {
    if (map.containsKey('info')) info = map['info'];
    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (info != null) data['info'] = this.info;
    return data;
  }
}
