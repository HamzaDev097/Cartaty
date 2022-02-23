import 'package:cartaty/Views/HomePage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'Views/dashboard_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

Future<void> foo() async {
  await GetStorage.init();
}

main() {
  foo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale("ar", "AE"),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: SplashActivity(),
      ),
    );
  }
}

class SplashActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashActivityState();
  }
}

class SplashActivityState extends State<SplashActivity> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.off(DashboardView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
