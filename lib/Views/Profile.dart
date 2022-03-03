import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:cartaty/Views/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  Themes theme = new Themes();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer_Content(),
      backgroundColor: Color(theme.getColor("backgrouund")),
      body: ListView(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(theme.getColor("itemsColor")),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 120.0)),
            ),
            child: Column(children: [
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
                    "الملف الشخصي",
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
              const SizedBox(height: 14),
              Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(100)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/man.png',
                      ))),
              const SizedBox(height: 4),
              Text(
                "الملف الشخصي",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(theme.getColor("mainTextColor"))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/Bulk-Location.svg"),
                  const SizedBox(width: 10),
                  Text(
                    "العراق-بغداد",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(theme.getColor("secendTextColor"))),
                  ),
                ],
              )
            ]),
          ),
          const SizedBox(height: 20),
          item("assets/icons/Profile_Red.svg", "الاسم"),
          const SizedBox(height: 20),
          item("assets/icons/call.svg", "رقم الموبايل"),
          const SizedBox(height: 20),
          item("assets/icons/mail.svg", "البريد الاكتروني"),
          const SizedBox(height: 20),
          item("assets/icons/Bulk-Location.svg", "العنوان"),
        ],
      ),
    );
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
                      color: Color(theme.getColor("iconsColor")),
                      width: 22,
                      height: 22),
                ),
                const SizedBox(width: 9),
                Text("$text",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
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
