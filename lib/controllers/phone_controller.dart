import 'package:get/get.dart';

class PhoneController extends GetxController {
  var phoneContent = 0.obs;

  void switchPhoneContent(int position) {
    phoneContent(position);
  }
}
