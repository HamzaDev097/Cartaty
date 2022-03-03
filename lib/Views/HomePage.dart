import 'package:cartaty/Controller/CategoriesController.dart';
import 'package:cartaty/Controller/HomePageController.dart';
import 'package:cartaty/Views/Categories.dart';

import 'package:cartaty/Views/balance.dart';
import 'package:cartaty/Views/drawer.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List Task = [
    ['assets/images/Tasks/sell_cards.png', "بيع كارتات", 'itemsColor'],
    ['assets/images/Tasks/Account_statement.png', "كشف حساب", 'itemsColor'],
    ['assets/images/Tasks/Transfer.png', "تحويل رصيد", 'itemsColor'],
    ['assets/images/Tasks/fill_account.png', "تعبئة الجهاز", 'itemsColor'],
  ];

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Themes theme = new Themes();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Color(theme.getColor("backgrouund")),
              key: _globalKey,
              drawer: Drawer_Content(),
              body: (controller.HomePageJson == null)
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color:
                                        Color(theme.getColor("mainTextColor")),
                                    size: 30,
                                  ),
                                  onPressed: () =>
                                      _globalKey.currentState!.openDrawer()),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications_outlined,
                                      color: Color(
                                          theme.getColor("mainTextColor")),
                                      size: 30))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Card(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        'assets/images/man.png',
                                      ))),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  const SizedBox(height: 7),
                                  Text(
                                    'مرحباً بك',
                                    style: TextStyle(
                                        color: Color(
                                            theme.getColor("secendTextColor")),
                                        fontSize: 20.0),
                                  ),
                                  Text(
                                    controller.HomePageJson['User']
                                        ['User_Name'],
                                    style: TextStyle(
                                        color: Color(
                                            theme.getColor("mainTextColor")),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Balance(controller.HomePageJson['User']['Balance']),
                          const SizedBox(height: 20),
                          CarouselSlider(
                              items: controller.HomePageJson['Advertisement']
                                  .map<Widget>(
                                    (item) => Container(
                                      height: 193,
                                      width: 343,
                                      margin: const EdgeInsets.all(7),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            'http://192.168.100.61:3000/Photo/readAdsPhoto?photo=' +
                                                item["Photo"],
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          )),
                                    ),
                                  )
                                  .toList(),
                              options: CarouselOptions(
                                autoPlay: true,
                                disableCenter: false,
                              )),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "المهام",
                                  style: TextStyle(
                                      color: Color(
                                          theme.getColor("mainTextColor")),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "المزيد",
                                  style: TextStyle(
                                      color: Color(
                                          theme.getColor("secendTextColor")),
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: Task.map((task) {
                                  return TaskCard(task[0], task[1], task[2]);
                                }).toList(),
                              )),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "التصنيفات",
                                  style: TextStyle(
                                      color: Color(
                                          theme.getColor("mainTextColor")),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                    onTap: () {
                                      Get.to(Categories());
                                    },
                                    child: Text(
                                      "المزيد",
                                      style: TextStyle(
                                          color: Color(theme
                                              .getColor("secendTextColor")),
                                          fontSize: 18),
                                    )),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: controller.HomePageJson['Categories']
                                    .map<Widget>((categories) {
                                  return (controller.HomePageJson['Categories']
                                              .indexOf(categories) >
                                          3)
                                      ? Container()
                                      : CategoriesCard(
                                          categories["Photo"],
                                          categories["Name"],
                                          categories["itemBackGround"]);
                                }).toList(),
                              )),
                          const SizedBox(height: 30),
                        ]));
        });
  }
}

class TaskCard extends StatelessWidget {
  var Path;
  var Title;
  var Color_;

  TaskCard(Path, Title, Color_) {
    this.Path = Path;
    this.Title = Title;
    this.Color_ = Color_;
  }

  @override
  Widget build(BuildContext context) {
    Themes theme = new Themes();
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(theme.getColor("$Color_")),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),
          Container(height: 50, width: 50, child: Image.asset('$Path')),
          const SizedBox(height: 5),
          Text(Title,
              style: TextStyle(
                  color: Color(theme.getColor("mainTextColor")),
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ],
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  var Path;
  var Title;
  var Backgrouund;

  // var Color_;

  CategoriesCard(this.Path, this.Title, this.Backgrouund);

  @override
  Widget build(BuildContext context) {
    Themes theme = new Themes();
    return Container(
      height: 100,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(int.parse("$Backgrouund")),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),
          Container(
              height: 50,
              width: 50,
              child: Image.network(
                  'http://192.168.100.61:3000/Photo/readCategoriesPhoto?photo=$Path')),
          const SizedBox(height: 5),
          Text(Title,
              style: TextStyle(
                  color: Color(theme.getColor("mainTextColor")),
                  fontWeight: FontWeight.bold,
                  fontSize: 18))
        ],
      ),
    );
  }
}
