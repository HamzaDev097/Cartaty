import 'package:cartaty/colors/theme.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  var balance;
  Themes theme = new Themes();
  Balance(balance) {
    this.balance = balance;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(theme.getColor("itemsColor")),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(height: 12),
                Text(
                  'الرصيد الحالي',
                  style: TextStyle(
                      color: Color(theme.getColor("secendTextColor")),
                      fontSize: 20.0),
                ),
                Text(
                  'IQD $balance',
                  style: TextStyle(
                      color: Color(theme.getColor("mainTextColor")),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(theme.getColor("mainTextColor")),
            size: 33,
          ),
        ],
      ),
    );
  }
}
