// ignore_for_file: prefer_const_constructors

import 'package:card_swiper/card_swiper.dart';
import 'package:clothes_shop_firebase/const/const.dart';
import 'package:clothes_shop_firebase/inner_screens/feed_screen.dart';
import 'package:clothes_shop_firebase/inner_screens/on_sale_screen.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';

import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/feed_items.dart';
import 'package:clothes_shop_firebase/widgets/on_sale_widget.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    final Size size = utils.getScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 3, //size.height *0.33
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    Consts.offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: Consts.offerImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red,
                  ),
                ),
                autoplay: true,
              ),
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: "Xem toàn bộ",
                maxLines: 1,
                color: Colors.blue,
                textSize: 20,
              ),
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On Sale".toUpperCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.287,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return OnSaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Các sản phẩm",
                      color: color,
                      textSize: 22,
                      isTitle: true,
                    ),
                    //Spacer(),
                    TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: FeedsScreens.routeName);
                      },
                      child: TextWidget(
                        text: "Xem tất cả",
                        maxLines: 1,
                        color: Colors.blue,
                        textSize: 20,
                      ),
                    ),
                  ]),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              childAspectRatio:0.667,
              children: List.generate(4, (index) {
                return FeedsWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
