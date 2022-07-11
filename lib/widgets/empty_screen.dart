import 'package:clothes_shop_firebase/inner_screens/feed_screen.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';
import 'package:clothes_shop_firebase/services/utils.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText})
      : super(key: key);
  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: title,
                color: Colors.red,
                textSize: 34,
                isTitle: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: subtitle,
                color: Colors.green,
                textSize: 20,
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    primary: Theme.of(context).colorScheme.secondary,
                    onPrimary: color,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: FeedsScreens.routeName);
                },
                child: TextWidget(
                  text: buttonText,
                  color:
                      themeState ? Colors.grey.shade300 : Colors.grey.shade800,
                  textSize: 20,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
