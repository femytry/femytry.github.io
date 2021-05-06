import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app_binding.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/views/pages/profile/profile_page.dart';
import 'package:portfolio/views/pages/welcome/welcome_page.dart';
import 'package:portfolio/views/pages/works/works_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Femy Try Kurnia',
      theme: Themes.light,
      initialBinding: AppBinding(),
      initialRoute: WelcomePage.route,
      getPages: [
        GetPage(name: WelcomePage.route, page: () => WelcomePage(),),
        GetPage(name: ProfilePage.route, page: () => ProfilePage(),),
        GetPage(name: WorksPage.route, page: () => WorksPage(),),
      ],
    );
  }
}
