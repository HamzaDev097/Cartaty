import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CardsController extends GetxController {
  var Cards;

  @override
  void onInit() async {
    super.onInit();
    final response = await http
        .get(Uri.parse('http://192.168.100.61:3000/Page/cards/get?id=3'));
    if (response.statusCode == 200) {
      Cards = json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
    update();
  }
}
