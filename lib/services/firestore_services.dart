import 'package:Indi_shark/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//users data
class FirestoreServices{
  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(uid) async {
    final data = await firestore.collection(userCollection).doc(uid).get();
    return data;
    // return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
}



