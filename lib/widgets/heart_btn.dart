import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {},
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
