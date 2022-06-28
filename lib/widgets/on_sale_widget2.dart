import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/heart_btn.dart';
import 'package:clothes_shop_firebase/widgets/price_widget.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleWidget2 extends StatefulWidget {
  const OnSaleWidget2({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget2> createState() => _OnSaleWidget2State();
}

class _OnSaleWidget2State extends State<OnSaleWidget2> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 8, top: 8),
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
                              height: size.height * 0.16,
                              width: size.width * 0.431,
                              boxFit: BoxFit.fill,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: "Áo Omachi #01",
                          color: color,
                          textSize: 16,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 6,
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
                            const SizedBox(
                              width: 35,
                            ),
                            const HeartBTN(),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Mua luôn',
                      maxLines: 1,
                      color: color,
                      textSize: 20,
                    ),
                    Icon(
                      IconlyLight.buy,
                      size: 20,
                      color: color,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
