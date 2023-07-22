import 'package:get/get.dart';

import '../consts/consts.dart';
import '../consts/firebase_consts.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    getUsername();
    super.onInit();

  }

  var currentNavIndex = 0.obs;

  var username = '';

  var featuredList = [];

  var searchController = TextEditingController();

  getUsername()async {
    var n = await firestore.collection(userCollection).where(
        'id', isEqualTo: currentUser!.uid).get().then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
    username = n;
  }

}