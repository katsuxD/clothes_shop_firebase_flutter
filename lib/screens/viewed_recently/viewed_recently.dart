// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:clothes_shop_firebase/screens/viewed_recently/viewed_widget.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';
import 'package:clothes_shop_firebase/widgets/back_widget.dart';
import 'package:clothes_shop_firebase/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class ViewedRecentlyScreen extends StatefulWidget {
  static const routeName = '/ViewedRecentlyScreen';

  const ViewedRecentlyScreen({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyScreenState createState() => _ViewedRecentlyScreenState();
}

class _ViewedRecentlyScreenState extends State<ViewedRecentlyScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    bool _isEmpty = true;
    // Size size = Utils(context).getScreenSize;

    if (_isEmpty == true) {
      return const EmptyScreen(
        imagePath: 'assets/images/history.png',
        title: 'Mại dô ༼ つ ◕_◕ ༽つ',
        subtitle: 'Bạn chưa qua món hàng nào',
        buttonText: 'Mua sắm ngay',
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                GlobalMethods.warningDialog(
                    title: 'Empty your history?',
                    subtitle: 'Are you sure?',
                    fct: () {},
                    context: context);
              },
              icon: Icon(
                IconlyBroken.delete,
                color: color,
              ),
            )
          ],
          leading: const BackWidget(),
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: TextWidget(
            text: 'History',
            color: color,
            textSize: 24.0,
          ),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: ViewedRecentlyWidget(),
              );
            }),
      );
    }
  }
}
