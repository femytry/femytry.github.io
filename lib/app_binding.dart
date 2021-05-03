
import 'package:get/get.dart';
import 'package:portfolio/controllers/page_route_controller.dart';
import 'package:portfolio/controllers/phone_controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(PageRouteController());
    Get.put(PhoneController());
  }
}