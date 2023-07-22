import 'dart:async';

import 'package:Indi_shark/consts/colors.dart';
import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/services/firestore_services.dart';
import 'package:Indi_shark/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category_screen/item_details.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({Key? key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
      ),
      body: FutureBuilder(
        future: FirestoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) {
            return Center(
            child: loadingIndicator(),
          );
          }else if(snapshot.data!.docs.isEmpty){
            return"No products found".text.makeCentered();
          }else {
            var data = snapshot.data!.docs;
            var filltered = data
                .where(
                  (element)=>element['p_name'].toString().toLowerCase().contains(title!.toLowerCase()),).toList();


            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300),
                children: filltered.mapIndexed((currentValue, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      filltered[index]['p_imgs'][0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const Spacer(),
                    "${ filltered[index]['p_name']}".text.fontFamily(semibold).make(),
                    10.heightBox,
                    "${filltered[index]['p_price']}".text.color(redColor).fontFamily(bold).size(16).make(),
                    10.heightBox
                  ],
                ).box
                    .white
                    .shadowSm
                    .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .roundedSM
                    .padding(const EdgeInsets.all(12))
                    .make()
                    .onTap(() {
                  Get.to(()=>ItemDetails(
                    title: "${filltered[index]['p_name']}",
                    data: filltered[index],
                  ));
                })
                )
                    .toList(),

              ),
            );
          }
        }
      )
    );
  }
}
