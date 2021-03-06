import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var HomePageJson;

  @override
  void onInit() async {
    super.onInit();
    final response = await http
        .get(Uri.parse('http://192.168.100.61:3000/Page/HomePage/get'));
    if (response.statusCode == 200) {
      HomePageJson = json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
    update();
  }
}
