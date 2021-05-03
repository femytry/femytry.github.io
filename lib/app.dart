import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app_binding.dart';
import 'package:portfolio/controllers/page_route_controller.dart';
import 'package:portfolio/utils/themes.dart';
import 'package:portfolio/views/pages/default_page.dart';
import 'package:portfolio/views/pages/profile/profile_page.dart';
import 'package:portfolio/views/pages/welcome/welcome_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Femy Try Kurnia',
      theme: Themes.light,
      home: MainView(),
      initialBinding: AppBinding(),
    );
  }
}

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageRouteController _pageController = Get.find();

  var routes = {'/welcome': WelcomePage(), '/profile': DefaultPage(page: '/profile',), '/works': DefaultPage(page: '/works',)};

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var r = _pageController.route.last;
      return AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: routes[r] ?? WelcomePage(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInOutBack,
      );
    });
  }
}
