import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payflow_asyncredux/app_state.dart';
import 'package:payflow_asyncredux/bill/bill_model.dart';
import 'package:payflow_asyncredux/bill/bill_state.dart';

//CRUD
class ReadDocsBillAction extends ReduxAction<AppState> {
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

    dispatch(SetBillListBillAction(billModelList: billModelList));
    return null;
  }
}

class StreamDocsBillAction extends ReduxAction<AppState> {
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
      dispatch(SetBillListBillAction(billModelList: billModelList));
    });
    BillState.billStream = streamList.listen((List<BillModel> billModelList) {
      dispatch(SetBillListBillAction(billModelList: billModelList));
    });

    return null;
  }
}

class StreamCancelBillAction extends ReduxAction<AppState> {
  StreamCancelBillAction();

  @override
  Future<AppState?> reduce() async {
    print('--> CancelStreamBillAction ');
    await BillState.billStream!.cancel();
    return null;
  }
}

class SetBillListBillAction extends ReduxAction<AppState> {
  final List<BillModel> billModelList;

  SetBillListBillAction({required this.billModelList});

  @override
  Future<AppState> reduce() async {
    return state.copyWith(
      billState: state.billState.copyWith(
        billList: billModelList,
      ),
    );
  }
}

class SetBillCurrentBillAction extends ReduxAction<AppState> {
  final String id;

  SetBillCurrentBillAction({required this.id});

  @override
  Future<AppState> reduce() async {
    BillModel billModelSelected =
        BillModel('', name: '', value: 0, dueDate: DateTime.now());
    if (id.isNotEmpty) {
      billModelSelected =
          state.billState.billList!.firstWhere((element) => element.id == id);
    }
    return state.copyWith(
      billState: state.billState.copyWith(
        billCurrent: billModelSelected,
      ),
    );
  }
}

class UpdateDocBillAction extends ReduxAction<AppState> {
  final String id;
  final BillModel billModel;

  UpdateDocBillAction({
    required this.id,
    required this.billModel,
  });
  @override
  Future<AppState?> reduce() async {
    print('--> UpdateDocBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var documentReference =
        firebaseFirestore.collection(BillModel.collection).doc(id);
    print(billModel);
    print(billModel.toData());
    await documentReference.update(billModel.toData());

    return null;
  }
}

class CreateDocBillAction extends ReduxAction<AppState> {
  final BillModel billModel;

  CreateDocBillAction({
    required this.billModel,
  });
  @override
  Future<AppState?> reduce() async {
    print('--> AddPayBillAction');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var collectionReference =
        firebaseFirestore.collection(BillModel.collection).doc();
    BillModel billModelTemp = billModel.copyWith(isPaid: false);
    await collectionReference.set(billModelTemp.toData());

    return null;
  }
}
