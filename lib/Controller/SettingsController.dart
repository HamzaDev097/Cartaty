import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  final SettingsControllerStorage = GetStorage();

  GetLanguages() {
    return SettingsControllerStorage.read("Language");
  }

  changeLanguage() {}
}
