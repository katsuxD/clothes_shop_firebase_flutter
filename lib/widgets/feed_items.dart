import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/price_widget.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FeedsWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Stack(
              children: [
                FancyShimmerImage(
                  imageUrl:
                      'https://product.hstatic.net/200000053174/product/6apcs001trk01-475k__1d554222054e4ce18f3129e3927acef5_master.jpg',
                  height: size.height * 0.15,
                  width: size.width * 0.45,
                  boxFit: BoxFit.fill,
                ),
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      IconlyLight.heart,
                      size: 22,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Áo thun Polo',
                  color: color,
                  textSize: 20,
                  isTitle: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PriceWidget(
                  salePrice: 2.99,
                  price: 5.9,
                  textPrice: _quantityTextController.text,
                  isOnSale: true,
                ),
                const SizedBox(
                  width: 11,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: FittedBox(
                          child: TextWidget(
                            text: 'SL',
                            color: color,
                            textSize: 18,
                            isTitle: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 20,
                        child: TextFormField(
                          controller: _quantityTextController,
                          key: const ValueKey('10'),
                          style: TextStyle(color: color, fontSize: 12),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          enabled: true,
                          onChanged: (valueee) {
                            setState(() {});
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9.]'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Icon(
                      //     IconlyLight.heart,
                      //     size: 22,
                      //     color: color,
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).cardColor),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(12.0),
                        //   bottomRight: Radius.circular(12.0),
                        // ),
                        ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Thêm vào giỏ',
                      maxLines: 1,
                      color: color,
                      textSize: 20,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.add,
                      size: 20,
                      color: color,
                    ),
                  ],
                ),
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
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
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
          )
        ]),
      ),
    );
  }
}
