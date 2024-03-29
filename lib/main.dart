// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:clothes_shop_firebase/const/theme_data.dart';
import 'package:clothes_shop_firebase/inner_screens/feed_screen.dart';
import 'package:clothes_shop_firebase/inner_screens/on_sale_screen.dart';
import 'package:clothes_shop_firebase/inner_screens/product_details.dart';
import 'package:clothes_shop_firebase/provider/dark_theme_provider.dart';
import 'package:clothes_shop_firebase/screens/auth/forget_pass.dart';
import 'package:clothes_shop_firebase/screens/auth/login.dart';
import 'package:clothes_shop_firebase/screens/auth/register.dart';
import 'package:clothes_shop_firebase/screens/btm_bar.dart';
import 'package:clothes_shop_firebase/screens/home_page.dart';

import 'package:clothes_shop_firebase/screens/orders/orders_screen.dart';
import 'package:clothes_shop_firebase/screens/viewed_recently/viewed_recently.dart';
import 'package:clothes_shop_firebase/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) {
        //     return MenuController();
        //   },
        // ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottomBarScreen(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedsScreens.routeName: (context) => const FeedsScreens(),
            ProductDetails.routeName: (context) => const ProductDetails(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            OrdersScreen.routeName: (context) => const OrdersScreen(),
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
          },
        );
      }),
    );
  }
}
