import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/heart_btn.dart';
import 'package:clothes_shop_firebase/widgets/price_widget.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FancyShimmerImage(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8XiN6kBbxbl3RWgzz1LBbNlTw_NPepN24ew&usqp=CAU',
                            height: size.height * 0.13,
                            width: size.width * 0.35,
                            boxFit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const PriceWidget(
                            isOnSale: true,
                            price: 5.9,
                            salePrice: 2.99,
                            textPrice: "1",
                          ),
                          const SizedBox(width: 8,),
                          const HeartBTN(),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextWidget(
                        text: "Áo Omachi #01",
                        color: color,
                        textSize: 16,
                        isTitle: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // GlobalMethods.navigateTo(
                      //     ctx: context, routeName: OnSaleScreen.routeName);
                    },
                    child: TextWidget(
                      text: "Mua lun",
                      maxLines: 1,
                      color: color,
                      textSize: 20,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Icon(
                  //     IconlyLight.bag2,
                  //     size: 22,
                  //     color: color,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
