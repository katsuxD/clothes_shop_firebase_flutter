import 'package:clothes_shop_firebase/inner_screens/product_details.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';
import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/heart_btn.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        GlobalMethods.navigateTo(
            ctx: context, routeName: ProductDetails.routeName);
      },
      child: Container(
        height: size.height * 0.25,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  width: size.width * 0.43,
                  height: size.width * 0.3,
                  child: FancyShimmerImage(
                    imageUrl:
                        "https://product.hstatic.net/200000053174/product/6apcs001trk01-475k__1d554222054e4ce18f3129e3927acef5_master.jpg",
                    boxFit: BoxFit.fill,
                  ),
                ),
                const Positioned(top: 10, right: 10.5, child: HeartBTN()),
              ],
            ),
            Flexible(
              child: TextWidget(
                text: "Ao thun",
                color: color,
                textSize: 18.0,
                isTitle: true,
                maxLines: 2,
              ),
            ),
            TextWidget(
              text: "\$2.59",
              color: color,
              textSize: 18.0,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).cardColor),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                    ),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Mua liền luôn',
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
          ],
        ),
      ),
    );
  }
}
