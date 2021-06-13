import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learning/data/models/todo.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection('notes');

class TodoHelper {
  static String? userID;
  static Future<void> addItem(Todo todo) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('todos').doc();
    await documentReference.set(todo.toJson());
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference noteReference =
        _collectionReference.doc(userID).collection('todos');
    return noteReference.snapshots();
  }

  static Future<void> updateItem(Todo todo) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('todos').doc(todo.id);

    await documentReference
        .update(todo.toJson())
        .whenComplete(() => print('data updated !!!'))
        .catchError((onError) => print(onError));
  }

  static Future<void> deleteItem({required String docID}) async {
    DocumentReference documentReference =
        _collectionReference.doc(userID).collection('todos').doc(docID);
    await documentReference
        .delete()
        .whenComplete(() => print('data deleted !!!'))
        .catchError((onError) => print(onError));
  }
}
