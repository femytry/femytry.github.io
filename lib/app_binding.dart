
import 'package:get/get.dart';
import 'package:portfolio/controllers/phone_controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(PhoneController());
  }
}