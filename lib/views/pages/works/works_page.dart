import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/page_route_controller.dart';

class WorksPage extends StatelessWidget {

  final PageRouteController _pageRouteController = Get.find();

  Future<bool> onWillPop(){
    if (_pageRouteController.bodyRoute.length > 1) {
      _pageRouteController.backBody();
    } else{
      _pageRouteController.backPage();
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Container(), onWillPop: () async => onWillPop(),);
  }
}
