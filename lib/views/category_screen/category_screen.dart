import 'package:Indi_shark/consts/list.dart';
import 'package:Indi_shark/controllers/product_controller.dart';
import 'package:Indi_shark/views/category_screen/category_details.dart';
import 'package:Indi_shark/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/consts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());


    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 8, mainAxisExtent: 200),
              itemBuilder: (context, index){
            return Column(
              children: [
                Image.asset(categoryImages[index], height: 120, width: 200, fit: BoxFit.cover),
                10.heightBox,
                categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
              controller.getSubCategories(categoriesList[index]);

              Get.to(
                      ()=>CategoryDetails(title: categoriesList[index]));
            });

              }
          ),
        ),
      )
    );
  }
}
