import 'package:cartaty/Controller/SettingsController.dart';
import 'package:cartaty/Views/Profile.dart';
import 'package:cartaty/Views/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cartaty/main.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Settings extends StatelessWidget {
  Themes theme = new Themes();
  int _Language = 1;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: Color(theme.getColor("backgrouund")),
        key: _globalKey,
        drawer: Drawer_Content(),
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Color(theme.getColor("mainTextColor")),
                      size: 30,
                    ),
                    onPressed: () => _globalKey.currentState!.openDrawer()),
                Text(
                  "الاعدادات",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(theme.getColor("mainTextColor"))),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined,
                        color: Color(theme.getColor("mainTextColor")),
                        size: 30))
              ],
            ),
            const SizedBox(height: 35),
            InkWell(child: item("assets/icons/Lock.svg", "تغير كلمة المرور")),
            const SizedBox(height: 20),
            InkWell(child: item("assets/icons/map.svg", "من نحن؟")),
            const SizedBox(height: 20),
            InkWell(child: item("assets/icons/Notification.svg", "الاشعارات")),
            const SizedBox(height: 20),
            InkWell(child: item("assets/icons/Wifi.svg", "نوع الاتصال")),
            const SizedBox(height: 20),
            InkWell(
                child: item("assets/icons/Language.svg", "اللغة"),
                onTap: () {
                  showModalBottomSheet(
                      elevation: 10,
                      context: context,
                      builder: (cntx) => GetX<SettingsController>(
                          init: SettingsController(),
                          builder: (controller) => Container()));
                }),
            const SizedBox(height: 20),
            InkWell(
              child: item("assets/icons/Dark.svg", "الوضع الليلي"),
            )
          ],
        ));
  }
}

class item extends StatelessWidget {
  Themes theme = new Themes();
  var images;
  var text;
  item(images, text) {
    this.images = images;
    this.text = text;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 14),
                Container(
                  height: 44,
                  width: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(theme.getColor("itemsColor")),
                  ),
                  child: SvgPicture.asset("$images",
                      color: Color(0xFF333333), width: 18, height: 18),
                ),
                const SizedBox(width: 9),
                Text("$text", style: TextStyle(fontSize: 20))
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(theme.getColor("mainTextColor")),
                  size: 22,
                ))
          ],
        ));
  }
}
