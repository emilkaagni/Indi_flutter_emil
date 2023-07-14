import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/controllers/product_controller.dart';
import 'package:Indi_shark/views/category_screen/item_details.dart';
import 'package:Indi_shark/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}): super (key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(120,60)
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .make()),
                ),
              ),
            //  items coontainer

              20.heightBox,

              Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                            imgP5,
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          "Laptop 4GB/64GB".text.fontFamily(semibold).make(),
                          10.heightBox,
                          "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                        ],
                      )
                              .box
                              .white
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .roundedSM.outerShadowSm
                              .padding(const EdgeInsets.all(12))
                              .make().onTap(() {
                                Get.to(()=> ItemDetails(title: "Dummy"));
                              });

                    }))
            ],
          ),
          )
        )

      );

  }
}
