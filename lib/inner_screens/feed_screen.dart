// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/feed_items.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FeedsScreens extends StatefulWidget {
  static const routeName = "/FeedsScreenState";
  const FeedsScreens({Key? key}) : super(key: key);

  @override
  State<FeedsScreens> createState() => _FeedsScreensState();
}

class _FeedsScreensState extends State<FeedsScreens> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "All Products",
          color: color,
          textSize: 24.0,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: kBottomNavigationBarHeight,
            child: TextField(
              focusNode: _searchTextFocusNode,
              controller: _searchTextController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.greenAccent, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.greenAccent, width: 1),
                ),
                hintText: "Bạn đang tìm mẫu nào?",
                prefixIcon: const Icon(Icons.search),
                suffix: IconButton(
                  onPressed: () {
                    _searchTextController!.clear();
                    _searchTextFocusNode.unfocus();
                  },
                  icon: Icon(
                    Icons.close_outlined,
                    color: _searchTextFocusNode.hasFocus ? Colors.red : color,
                  ),
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.667,
            children: List.generate(10, (index) {
              return FeedsWidget();
            }),
          ),
        ]),
      ),
    );
  }
}
