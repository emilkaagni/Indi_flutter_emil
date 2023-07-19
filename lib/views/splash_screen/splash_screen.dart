import 'package:Indi_shark/consts/colors.dart';
import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/views/auth_screen/login_screen.dart';
import 'package:Indi_shark/views/home_screen/home.dart';
import 'package:Indi_shark/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //  using getx
        Get.to(()=>const LoginScreen());
      //   Get.to(()=>const Home());
      // auth.authStateChanges().listen((User? user) {
      //   if(user == null && mounted){
      //     Get.to(()=> const LoginScreen());
      //   }
      //   else{
      //     Get.to(()=> const Home());
      //   }
      // });
    });
  }

  @override
  void initState(){
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color for the first page when loading
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            applogoWidget(),
            //appname,credits,versions are set in lib>consts>strings.dart
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,


          ],
        ),

      ),
    );
  }
}