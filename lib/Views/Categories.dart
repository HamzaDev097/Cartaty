import 'package:cartaty/Controller/CategoriesController.dart';
import 'package:cartaty/Views/Cards.dart';
import 'package:cartaty/Views/HomePage.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Themes theme = new Themes();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
        init: CategoriesController(),
        builder: (controller) {
          return Scaffold(
              body: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: (controller.Categories == null)
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.count(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 3.0,
                          crossAxisCount: 3,
                          reverse: false,
                          children:
                              controller.Categories.map<Widget>((categories) {
                            return InkWell(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  color: Color(
                                      int.parse(categories["itemBackGround"])),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 14),
                                      Container(
                                          height: 62,
                                          width: 62,
                                          child: Image.network(
                                              'http://192.168.100.61:3000/Photo/readCategoriesPhoto?photo=' +
                                                  categories["Photo"])),
                                      const SizedBox(height: 10),
                                      Text(categories["Name"],
                                          style: TextStyle(
                                              color: Color(theme
                                                  .getColor("mainTextColor")),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.to(Cards());
                                });
                          }).toList(),
                        )));
        });
  }
}
