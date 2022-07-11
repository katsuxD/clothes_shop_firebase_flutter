import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        IconlyLight.arrowLeft2,
        color: color,
      ),
    );
  }
}
