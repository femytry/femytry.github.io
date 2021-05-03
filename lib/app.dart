import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app_binding.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/views/pages/welcome/welcome_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Femy Try Kurnia',
      theme: Themes.light,
      home: WelcomePage(),
      initialBinding: AppBinding(),
    );
  }
}
