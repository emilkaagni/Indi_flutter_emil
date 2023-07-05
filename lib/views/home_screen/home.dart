import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/controllers/home_controller.dart';
import 'package:Indi_shark/views/cart_screen/cart_screen.dart';
import 'package:Indi_shark/views/category_screen/category_screen.dart';
import 'package:Indi_shark/views/home_screen/home_screen.dart';
import 'package:Indi_shark/views/profile_screen/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());

    var navbarItem=[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart,width: 26), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26), label: account),

    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),

    ];


    return Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
            ()=> BottomNavigationBar(
                currentIndex: controller.currentNavIndex.value,
                selectedItemColor: redColor,
                selectedLabelStyle: const TextStyle(fontFamily: semibold),
                type: BottomNavigationBarType.fixed,
                backgroundColor: whiteColor,
                items: navbarItem,
                onTap: (value){
                  controller.currentNavIndex.value=value;
          }

        ),
      ),


      // bottomNavigationBar: BottomNavigationBar(items: []) ,
    );
  }
}
