import 'package:Indi_shark/controllers/cart_controller.dart';
import 'package:Indi_shark/services/firestore_services.dart';
import 'package:Indi_shark/views/cart_screen/shipping_screen.dart';
import 'package:Indi_shark/widgets_common/our_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets_common/loading_indicator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());


    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ourButton(
            color: redColor,
            onPress: (){
              Get.to(
                      ()=>const ShippingDetails());
            },
            textColor: whiteColor,
            title: "Proceed to shipping"
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart"
            .text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),

            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: loadingIndicator(),
                );
              }else if(snapshot.data!.docs.isEmpty){
                return Center(
                  child: "Cart is Empty".text.color(darkFontGrey).make(),
                );
              }else{
                var data = snapshot.data!.docs;
                controller.calculate(data);
                controller.productSnapshot = data;



                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index){
                              return ListTile(
                                leading: Image.network(
                                    "${data[index]['img']}",
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                                title: "${data[index]['title']} (x${data[index]['qty']})"
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                                subtitle: "${data[index]['tprice']}"
                                    .numCurrency
                                    .text
                                    .color(redColor)
                                    .fontFamily(semibold)
                                    .make(),

                                trailing: const Icon(
                                  Icons.delete,
                                  color: redColor,
                                ).onTap(() {
                                  FirestoreServices.deleteDocument(data[index].id);
                                }),

                              );


                              },
                          ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Price".text.fontFamily(semibold).color(darkFontGrey).make(),

                          Obx(
                                ()=> "${controller.totalP.value}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .make(),
                          ),

                        ],
                      ).box.padding(EdgeInsets.all(12)).color(lightGolden).width(context.screenWidth -60).roundedSM.make(),
                      10.heightBox,
                      // SizedBox(
                      //   width: context.screenWidth -60,
                      //   child: ourButton(
                      //       color: redColor,
                      //       onPress: (){},
                      //       textColor: whiteColor,
                      //       title: "Proceed to shipping"
                      //   ),
                      // ),
                    ],
                  ),
                );
              }
            },

          )
    );
  }
}
