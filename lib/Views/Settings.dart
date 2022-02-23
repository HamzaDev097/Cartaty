import 'package:cartaty/main.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Settings extends StatelessWidget {
  Themes theme = new Themes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        InkWell(
            child: const Text("Cahnge Theme"),
            onTap: () {
              theme.changeTheme();
            })
      ],
    ));
  }
}
