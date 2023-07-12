import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/controllers/profile_controller.dart';
import 'package:Indi_shark/widgets_common/bg_widget.dart';
import 'package:Indi_shark/widgets_common/custom_textfield.dart';
import 'package:Indi_shark/widgets_common/our_button.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
            mainAxisSize: MainAxisSize.min ,
            children: [
            Image.asset(imgProfile2, width: 100, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(color: redColor, onPress: (){
              Get.find<ProfileController>().changeImage(context);
            }, textColor: whiteColor, title: "change"),
            Divider(),
            20.heightBox,
            customTextField(hint: nameHint, title: name, isPass: false),
            customTextField(hint: password, title: password, isPass: true),
              20.heightBox,
              SizedBox(
                width: context.screenWidth -60,
                  child: ourButton(color: redColor, onPress: (){}, textColor: whiteColor, title: "Save")),


            ],
        ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make(),
      )
    );
  }
}
