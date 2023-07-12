import 'package:Indi_shark/consts/consts.dart';

//users data
class FirestoreServices{
  static getUser(uid){
    return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }
}



