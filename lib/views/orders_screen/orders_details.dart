import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/views/orders_screen/components/order_status.dart';
import 'package:flutter/material.dart';


class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({Key? key, this.data}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Column(
        children: [
          orderStatus(color: redColor, icon: Icons.done, title: "Placed", showDone: data['order_placed']),
          orderStatus(color: Vx.blue900, icon: Icons.thumb_up, title: "Confirmed", showDone: data['order_confirmed']),
          orderStatus(color: Colors.yellow, icon: Icons.local_shipping, title: "On Delivery", showDone: data['order_on_delivery']),
          orderStatus(color: Colors.purple, icon: Icons.done_all, title: "Delivered", showDone: data['order_delivered']),



        ],
      ),
    );
  }
}


