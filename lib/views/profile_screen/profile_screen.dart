import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/consts/list.dart';
import 'package:Indi_shark/controllers/auth_controller.dart';
import 'package:Indi_shark/controllers/profile_controller.dart';
import 'package:Indi_shark/services/firestore_services.dart';
import 'package:Indi_shark/views/auth_screen/login_screen.dart';
import 'package:Indi_shark/views/chat_screen/messaging_screen.dart';
import 'package:Indi_shark/views/orders_screen/orders_screen.dart';
import 'package:Indi_shark/views/profile_screen/components/details_card.dart';
import 'package:Indi_shark/views/profile_screen/edit_profile_screen.dart';
import 'package:Indi_shark/views/wishlist_screen/wishlist_screen.dart';
import 'package:Indi_shark/widgets_common/bg_widget.dart';
import 'package:Indi_shark/widgets_common/loading_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());


    return bgWidget(
      child: Scaffold(
        body: FutureBuilder(
          future: FirestoreServices.getUser(currentUser?.uid),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot>  snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }
            else{
              if(snapshot.data == null){
                return Text("e");
              }
              var data = snapshot.data!;
              return  SafeArea(
                  child: Column(
                    children: [

                      //edit profile button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.edit, color: whiteColor)
                        ).onTap(() {

                          controller.nameController.text = data['name'].toString();
                          // controller.passController.text = data['password'];

                          Get.to(()=> EditProfileScreen(data: data));
                        }),
                      ),
                      //users details section

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            data['imageUrl']==''

                                ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),



                            10.widthBox,
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}".text.fontFamily(semibold).white.make(),
                                    "${data['email']}".text.white.make()

                                  ],
                                )),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: whiteColor,
                                  )
                              ),
                              onPressed: () async{
                                await Get.put(AuthController()).signoutMethod(context);
                                Get.offAll(()=> const LoginScreen());
                              },
                              child: logout.text.fontFamily(semibold).white.make(),
                            )

                          ],
                        ),
                      ),
                      20.heightBox,
                      FutureBuilder(
                          future: FirestoreServices.getCounts(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(!snapshot.hasData){
                              return Center(child: loadingIndicator());
                            }else {
                              var countData = snapshot.data;

                              return Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  detailsCard(
                                      count: countData[0].toString(),
                                      title: "in your cart",
                                      width: context.screenWidth / 3.4),
                                  detailsCard(
                                      count: countData[1].toString(),
                                      title: "in your wishlist",
                                      width: context.screenWidth / 3.4),
                                  detailsCard(
                                      count: countData[2].toString(),
                                      title: "your orders",
                                      width: context.screenWidth / 3.4),
                                ],
                              );
                            }

                          },
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     detailsCard(count: data['cart_count'], title: "in your cart", width: context.screenWidth / 3.4),
                      //     detailsCard(count: data['wishlist_count'], title: "in your wishlist", width: context.screenWidth / 3.4),
                      //     detailsCard(count: data['order_count'], title: "your orders", width: context.screenWidth / 3.4),
                      //   ],
                      // ),
                      //  button section

                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index){
                          return const Divider(color: lightGrey);
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (BuildContext context, int index){
                          return ListTile(
                            onTap: (){
                              switch(index){
                                case 0:
                                  Get.to(()=> OrdersScreen());
                                  break;
                                case 1:
                                  Get.to(()=> WishlistScreen());
                                  break;
                                case 2:
                                  Get.to(()=> MessagesScreen());
                                  break;
                              }
                            },
                            leading: Image.asset(
                              profileButtonsIcon[index],
                              width: 22,
                            ),
                            title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                          );
                        },
                      ).box.white.rounded.margin(EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(Colors.white).make(),
                    ],
                  )
              );
            }
          },
        ),
      ),
    );
  }
}