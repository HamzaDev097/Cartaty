import 'package:cartaty/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class Themes extends GetxController {
  final theme = GetStorage();

  Map<String, Object> darkTheme = {
    "backgrouund": "0xFF000000",
    "itemsColor": "0xFF252525",
    "iconsColor": "0xFFB0B0B0",
    "mainTextColor": "0xFFFFFFFF",
    "secendTextColor": "0xFFC2C2C2",
    "popcorn": "0xFFF2EFFF",
    "games": "0xFFF0FFEF",
    "internet": "0xFFE7FFE5",
    "shopping_bag": "0xFFDEFFFD",
  };
  Map<String, Object> whiteTheme = {
    "backgrouund": "0xFFFFFFFF",
    "iconsColor": "0xFFB0B0B0",
    "itemsColor": "0xFFF6F6F6",
    "mainTextColor": "0xFF000000",
    "secendTextColor": "0xFF949494",
    "popcorn": "0xFFF2EFFF",
    "games": "0xFFF0FFEF",
    "internet": "0xFFE7FFE5",
    "shopping_bag": "0xFFDEFFFD",
  };

  getColor(key) {
    theme.writeIfNull("Theme", 2);

    if (theme.read('Theme') == 1) {
      return int.parse(darkTheme[key].toString());
    } else {
      return int.parse(whiteTheme[key].toString());
    }
  }

  changeTheme() {
    theme.writeIfNull("Theme", 2);
    if (theme.read('Theme') == 1) {
      theme.write('Theme', 2);
    } else {
      theme.write('Theme', 1);
    }
    print(theme.read('Theme'));
    Get.offAll(SplashActivity());
    update();
  }
}
