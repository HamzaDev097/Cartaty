import 'package:cartaty/Controller/dashboard_controller.dart';
import 'package:cartaty/Views/HomePage.dart';
import 'package:cartaty/Views/Profile.dart';
import 'package:cartaty/Views/Settings.dart';
import 'package:cartaty/Views/wallet.dart';
import 'package:cartaty/colors/theme.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardView extends StatelessWidget {
  Themes theme = new Themes();
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: CustomNavigationBar(
              onTap: landingPageController.changeTabIndex,
              currentIndex: landingPageController.tabIndex.value,
              iconSize: 30.0,
              backgroundColor: Colors.white,
              strokeColor: Colors.white,
              items: [
                BottomNavigationBarItems(
                    "assets/icons/Home_notFULL.svg", "assets/icons/Home.svg"),
                BottomNavigationBarItems(
                    "assets/icons/Profile.svg", "assets/icons/Profile_Red.svg"),
                BottomNavigationBarItems(
                    "assets/icons/Wallet.svg", "assets/icons/Wallet_Red.svg"),
                BottomNavigationBarItems(
                    "assets/icons/Setting.svg", "assets/icons/Setting_Red.svg"),
              ]),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, dashboardController),
      body: Obx(() => IndexedStack(
            index: dashboardController.tabIndex.value,
            children: [HomePage(), Profile(), Wallet(), Settings()],
          )),
    ));
  }

  BottomNavigationBarItems(icon, activeIcon) {
    return CustomNavigationBarItem(
        icon: SvgPicture.asset("$icon"),
        selectedIcon: SvgPicture.asset(
          "$activeIcon",
          color: const Color(0xFFAA0100),
        ));
  }
}
