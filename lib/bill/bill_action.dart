import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_state.dart';

//CRUD
class GetCollectionBillAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    print('--> ReadAllBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var querySnapshot =
        await firebaseFirestore.collection(BillModel.collection).get();
    var billModelList = querySnapshot.docs
        .map((queryDocumentSnapshot) => BillModel.fromMap(
            queryDocumentSnapshot.id, queryDocumentSnapshot.data()))
        .toList();

    dispatch(BillModelListBillAction(billModelList: billModelList));
    return null;
  }
}

class StreamCollectionBillAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    print('--> StreamCollectionBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Query<Map<String, dynamic>> collRef;
    collRef = firebaseFirestore.collection(BillModel.collection);
    // .where('paid', isEqualTo: true);

    Stream<QuerySnapshot<Map<String, dynamic>>> streamQuerySnapshot =
        collRef.snapshots();

    Stream<List<BillModel>> streamList = streamQuerySnapshot.map(
        (querySnapshot) => querySnapshot.docs
            .map((docSnapshot) =>
                BillModel.fromMap(docSnapshot.id, docSnapshot.data()))
            .toList());
    streamList.listen((List<BillModel> billModelList) {
      dispatch(BillModelListBillAction(billModelList: billModelList));
    });
    BillState.billStream = streamList.listen((List<BillModel> billModelList) {
      dispatch(BillModelListBillAction(billModelList: billModelList));
    });

    return null;
  }
}

class CancelStreamBillAction extends ReduxAction<AppState> {
  CancelStreamBillAction();

  @override
  Future<AppState?> reduce() async {
    print('--> CancelStreamBillAction ');
    await BillState.billStream!.cancel();
    return null;
  }
}

class BillModelListBillAction extends ReduxAction<AppState> {
  final List<BillModel> billModelList;

  BillModelListBillAction({required this.billModelList});

  @override
  Future<AppState> reduce() async {
    return state.copyWith(
      billState: state.billState.copyWith(
        billList: billModelList,
      ),
    );
  }
}

class UpdatePayBillAction extends ReduxAction<AppState> {
  final String id;
  final bool paid;

  UpdatePayBillAction({
    required this.id,
    required this.paid,
  });
  @override
  Future<AppState?> reduce() async {
    print('--> ReadAllBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var documentReference =
        firebaseFirestore.collection(BillModel.collection).doc(id);
    await documentReference.update({'paid': paid});

    return null;
  }
}

class AddPayBillAction extends ReduxAction<AppState> {
  final BillModel billModel;

  AddPayBillAction({
    required this.billModel,
  });
  @override
  Future<AppState?> reduce() async {
    print('--> AddPayBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var collectionReference =
        firebaseFirestore.collection(BillModel.collection).doc();
    BillModel billModelTemp = billModel.copyWith(paid: false);
    await collectionReference.set(billModelTemp.toMap());

    return null;
  }
}
