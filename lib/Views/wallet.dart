import 'package:cartaty/Views/balance.dart';
import 'package:cartaty/Views/drawer.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  Themes theme = new Themes();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  List smallItems = [
    [
      'https://play-lh.googleusercontent.com/oSdbtbdsbWZgy-zzLbcRfAyQeSCHfWs0MsxdSRRpN8_e6VvMMKRuVPN7qXTlYQ9Nrg',
      'زين'
    ],
    [
      'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/v1484136709/tradryaoxb0hdzgjiqxa.png',
      'اسياسيل'
    ],
    [
      'https://images-na.ssl-images-amazon.com/images/I/51rkz8wallL.jpg',
      'Pubg'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBpjPIl9wDno4Axa01Ix88a4IKimeriOgMd8iVP9cYJvJSFpdTEOLja9m4GYUcxzizXVI&usqp=CAU',
      'كريم'
    ],
    [
      'https://play-lh.googleusercontent.com/oSdbtbdsbWZgy-zzLbcRfAyQeSCHfWs0MsxdSRRpN8_e6VvMMKRuVPN7qXTlYQ9Nrg',
      'زين'
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: Drawer_Content(),
        backgroundColor: Color(theme.getColor("backgrouund")),
        body: ListView(children: [
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
                "المحفظة",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(theme.getColor("mainTextColor"))),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined,
                      color: Color(theme.getColor("mainTextColor")), size: 30))
            ],
          ),
          Balance("100.000"),
          const SizedBox(height: 6),
          Text("التحويلات الشائعة",
              style: TextStyle(
                  color: Color(theme.getColor("mainTextColor")), fontSize: 18)),
          const SizedBox(height: 6),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: smallItems.map((smallItemss) {
                return smallItem(smallItemss[0], smallItemss[1]);
              }).toList())),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "المعاملات الاخيرة",
                  style: TextStyle(
                      color: Color(theme.getColor("mainTextColor")),
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "المزيد",
                  style: TextStyle(
                      color: Color(theme.getColor("secendTextColor")),
                      fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          item(
              "https://images-na.ssl-images-amazon.com/images/I/51rkz8wallL.jpg",
              "PUBG Mobile",
              "5.000")
        ]));
  }
}

class smallItem extends StatelessWidget {
  var link;
  var title;

  smallItem(link, title) {
    this.link = link;
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    Themes theme = new Themes();
    return Container(
      height: 90,
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(theme.getColor("itemsColor")),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(link, height: 44, width: 44),
          ),
          const SizedBox(height: 2),
          Text(title,
              style: TextStyle(
                  color: Color(theme.getColor("mainTextColor")),
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ],
      ),
    );
  }
}

class item extends StatelessWidget {
  Themes theme = new Themes();
  var images;
  var text;
  var amount;
  item(images, text, amount) {
    this.images = images;
    this.text = text;
    this.amount = amount;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(images, height: 65, width: 65),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text("$text",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(theme.getColor("mainTextColor")))),
                    Text("12 Oct, 2021 | 12:23",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(theme.getColor("secendTextColor")))),
                  ],
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("IQD $amount ",
                    style: TextStyle(
                      color: Color(theme.getColor("mainTextColor")),
                      fontSize: 22,
                    )))
          ],
        ));
  }
}
