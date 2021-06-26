abstract class FirestoreModel {
  static late final String collection;
  final String id;

  FirestoreModel(this.id);
  FirestoreModel fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap();
  @override
  String toString() {
    return id + ':' + toMap().toString();
  }
}
