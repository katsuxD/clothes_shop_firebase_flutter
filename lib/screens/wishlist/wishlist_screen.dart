// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:clothes_shop_firebase/screens/wishlist/wishlist_widget.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';
import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/back_widget.dart';
import 'package:clothes_shop_firebase/widgets/empty_screen.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    bool _isEmpty = true;
    //Size size = Utils(context).getScreenSize;
    if (_isEmpty == true) {
      return const EmptyScreen(
        imagePath: 'assets/images/wishlist.png',
        title: 'Không iu rồi 💢💘',
        subtitle: 'Bạn chưa thích món hàng nào',
        buttonText: 'Khám phá ngay',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: const BackWidget(),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            color: color,
            text: "Món hàng bạn thích",
            isTitle: true,
            textSize: 22,
          ),
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: "Xóa hết mẫu yêu thích?",
                    subtitle: "Đừng làm như thế ༼ つ ◕_◕ ༽つ?",
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyLight.delete,
                color: color,
              ),
            ),
          ],
        ),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ),
      );
    }
  }
}
