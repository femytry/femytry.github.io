import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveWidget extends StatelessWidget {

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;


  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen, this.smallScreen
  }) : super(key: key);

  static bool isSmallScreen(){
    return Get.width < 800;
  }

  static bool isMediumScreen(){
    return Get.width >= 800 && Get.width <= 1200;
  }

  static bool isLargeScreen(){
    return Get.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return largeScreen;
          } else if(constraints.maxWidth <= 1200 && constraints.maxWidth >= 800){
            return mediumScreen ?? largeScreen;
          } else{
            return smallScreen ?? largeScreen;
          }
        },
    );
  }
}
