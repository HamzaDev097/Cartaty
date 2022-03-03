import 'package:cartaty/Controller/CardsController.dart';
import 'package:cartaty/Controller/CategoriesController.dart';
import 'package:cartaty/Views/HomePage.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cards extends StatelessWidget {
  Themes theme = new Themes();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardsController>(
        init: CardsController(),
        builder: (controller) {
          return Scaffold(
              body: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: (controller.Cards == null)
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.count(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 3.0,
                          crossAxisCount: 3,
                          reverse: false,
                          children: controller.Cards.map<Widget>((cards) {
                            return InkWell(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  color: Color(0xffEBEBEB),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 14),
                                      Container(
                                          height: 62,
                                          width: 62,
                                          child: Image.network(
                                              'http://192.168.100.61:3000/Photo/readCategoriesPhoto?photo=')),
                                      const SizedBox(height: 10),
                                      Text(cards["Card_Name"],
                                          style: TextStyle(
                                              color: Color(theme
                                                  .getColor("mainTextColor")),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))
                                    ],
                                  ),
                                ),
                                onTap: () {});
                          }).toList(),
                        )));
        });
  }
}
