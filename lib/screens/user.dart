import 'package:clothes_shop_firebase/provider/dark_theme_provider.dart';
import 'package:clothes_shop_firebase/screens/orders/orders_screen.dart';
import 'package:clothes_shop_firebase/screens/viewed_recently/viewed_recently.dart';
import 'package:clothes_shop_firebase/screens/wishlist/wishlist_screen.dart';
import 'package:clothes_shop_firebase/services/global_method.dart';
import 'package:clothes_shop_firebase/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: "Hi,   ",
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Khánh",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              TextWidget(
                color: color,
                text: "khanhadmin@gmail.com",
                textSize: 18,
                isTitle: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  "Địa chỉ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () async {
                  await _showAddressdialog();
                },
                subtitle: TextWidget(
                  text: "217 An Dương Vương",
                  color: color,
                  textSize: 18,
                ),
                leading: const Icon(IconlyLight.profile),
                trailing: const Icon(IconlyLight.arrowRight2),
              ),
              _listTile(
                  title: "Đặt hàng",
                  icon: IconlyLight.bag,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        ctx: context, routeName: OrdersScreen.routeName);
                  },
                  color: color),
              _listTile(
                title: "Món hàng yêu thích",
                icon: IconlyLight.heart,
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: WishlistScreen.routeName);
                },
                color: color,
              ),
              _listTile(
                  title: "Quản lý mật khẩu",
                  icon: IconlyLight.password,
                  onPressed: (onPressed) {},
                  color: color),
              _listTile(
                  title: "Món hàng đã xem",
                  icon: IconlyLight.show,
                  onPressed: () {
                    GlobalMethods.navigateTo(
                        ctx: context,
                        routeName: ViewedRecentlyScreen.routeName);
                  },
                  color: color),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? "Chế độ tối" : "Chế độ sáng",
                  color: color,
                  textSize: 24,
                  isTitle: true,
                ),
                secondary: Icon(themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onChanged: (bool value) {
                  setState(() {
                    themeState.setDarkTheme = value;
                  });
                },
                value: themeState.getDarkTheme,
              ),
              _listTile(
                title: "Đăng xuất",
                icon: IconlyLight.logout,
                onPressed: () {
                  GlobalMethods.warningDialog(
                      title: "Đăng xuất",
                      subtitle: "Bạn có chắc muốn đăng xuất",
                      fct: () {},
                      context: context);
                },
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressdialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Cập nhập thông tin"),
            content: TextField(
              onChanged: (value) {
                // _addressTextController.text;
              },
              controller: _addressTextController,
              maxLength: 5,
              decoration: const InputDecoration(
                hintText: "Nhập địa chỉ của bạn",
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Update"),
              )
            ],
          );
        });
  }

  Widget _listTile({
    required String title,
    // String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      // subtitle: TextWidget(
      //   text: subtitle ?? "",
      //   color: color,
      //   textSize: 18,
      // ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
