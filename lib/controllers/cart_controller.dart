import 'package:get/get.dart';

import '../consts/consts.dart';

class CartController extends GetxController{
  var total1P = 0.obs;

  //text controllers for shipping details
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalcodeController = TextEditingController();
  var phoneController = TextEditingController();


  calculate(data){
    total1P.value = 0;
    for(var i=0; i<data.length; i++){
      total1P.value = total1P.value +int.parse(data[i]['tprice'].toString());
    }
  }
}