import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoriesController extends GetxController {
  var Categories;

  @override
  void onInit() async {
    super.onInit();
    final response = await http
        .get(Uri.parse('http://192.168.100.61:3000/Page/Categories/get'));
    if (response.statusCode == 200) {
      Categories = json.decode(response.body);
      print(Categories.length);
    } else {
      throw Exception('Failed to load album');
    }
    update();
  }
}
