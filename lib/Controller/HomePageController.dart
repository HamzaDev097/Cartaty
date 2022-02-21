import 'package:get/get.dart';

class HomeController extends GetxController {
  var CarouselSliderIndex = 0;

  void onPageChanged(index, reason) {
    CarouselSliderIndex = index;
    update();
  }
}
