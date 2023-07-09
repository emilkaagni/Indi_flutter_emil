import 'package:Indi_shark/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
  "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
  5.heightBox,
  "In your cart".text.color(darkFontGrey).make(),

      ],
  ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(4)).make();

}