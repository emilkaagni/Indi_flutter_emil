import 'package:Indi_shark/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//users data
class FirestoreServices{
  static Future<DocumentSnapshot<Map<String, dynamic>>> getUser(uid) async {
    final data = await firestore.collection(userCollection).doc(uid).get();
    return data;
    // return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
  //   get products according to category
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();

  }

  static getCart(uid){
    return firestore.collection(cartCollection).where('added by', isEqualTo: uid).snapshots();

  }

  static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }





}



