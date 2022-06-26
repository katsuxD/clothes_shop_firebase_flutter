import 'package:clothes_shop_firebase/provider/dark_theme_provider.dart';
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
                  onPressed: (onPressed) {},
                  color: color),
              _listTile(
                  title: "Món hàng yêu thích",
                  icon: IconlyLight.heart,
                  onPressed: (onPressed) {},
                  color: color),
              _listTile(
                  title: "Quản lý mật khẩu",
                  icon: IconlyLight.password,
                  onPressed: (onPressed) {},
                  color: color),
              _listTile(
                  title: "Món hàng đã xem",
                  icon: IconlyLight.show,
                  onPressed: (onPressed) {},
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
                onPressed: () async {
                  await _showLogoutdialog();
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

  Future<void> _showLogoutdialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text("Đăng xuất"),
            ]),
            content: const Text("Bạn có muốn đăng xuất?"),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                  color: Colors.cyan,
                  text: "Hủy",
                  textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: TextWidget(
                  color: Colors.red,
                  text: "Đồng ý",
                  textSize: 18,
                ),
              ),
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
