import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/categories_widget.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/aotaydai.jpg',
      'catText': 'Áo sơ mi',
    },
    {
      'imgPath': 'assets/images/cat/aobien.jpg',
      'catText': 'Áo biển',
    },
    {
      'imgPath': 'assets/images/cat/Jeanjacket.png',
      'catText': 'Jean',
    },
    {
      'imgPath': 'assets/images/cat/shirt.png',
      'catText': 'Sơ mi Jean',
    },
    {
      'imgPath': 'assets/images/cat/hoodie.jpg',
      'catText': 'Áo khoác',
    },
    {
      'imgPath': 'assets/images/cat/aothun.jpg',
      'catText': 'Áo thun',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Categories",
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 250 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CartegoryWidget(
              catText: catInfo[index]["catText"],
              passedColor: gridColors[index],
              imgPath: catInfo[index]["imgPath"],
            );
          }),
        ),
      ),
    );
  }
}
