import 'package:Indi_shark/consts/colors.dart';
import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/services/firestore_services.dart';
import 'package:Indi_shark/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My messages".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          } else if(snapshot.data!.docs.isEmpty){
            return "No messages yet!".text.color(darkFontGrey).makeCentered();
            }else {
            return Container();
          }
        },
      ),
    );
  }
}
