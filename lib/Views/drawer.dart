import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawer_Content extends StatelessWidget {
  Themes theme = new Themes();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(theme.getColor("backgrouund")),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(theme.getColor("itemsColor")),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 15),
                Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadiusDirectional.circular(100)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/images/man.png',
                        ))),
                const SizedBox(width: 10),
                Text(
                  "حمزة نزهان",
                  style: TextStyle(
                      fontSize: 21,
                      color: Color(theme.getColor("mainTextColor")),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Items("الصفحة الشخصية", "assets/icons/Home.svg"),
          Items("نوع الاتصال", "assets/icons/net.svg"),
          Items("التقارير", "assets/icons/Account_statement.svg"),
          Items("من نحن؟", "assets/icons/map.svg"),
          Items("سياسة الخصوصية", "assets/icons/Privacy_Policy.svg"),
          Items("تواصل معنا", "assets/icons/call.svg"),
          Items("وكلاء معتمدون", "assets/icons/Location.svg")
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  var title;
  var icon;

  Items(title, icon) {
    this.title = title;
    this.icon = icon;
  }
  Themes theme = new Themes();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(children: [
        const SizedBox(height: 9),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 33,
              height: 25,
              child: SvgPicture.asset(
                icon,
                color: Color(theme.getColor("iconsColor")),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '$title',
              style: TextStyle(
                  color: Color(theme.getColor("mainTextColor")), fontSize: 22),
            )
          ],
        ),
        const SizedBox(height: 9),
      ]),
      onTap: () => {},
    );
  }
}
