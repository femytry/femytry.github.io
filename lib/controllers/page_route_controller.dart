
import 'package:get/get.dart';

class PageRouteController extends GetxController{
  var route = ['/welcome'].obs;
  var bodyRoute = ['/profile'].obs;

  void switchPage(String r){
    route.add(r);
  }

  void backPage(){
    route.removeLast();
  }

  void initBody(String r){
    bodyRoute.clear();
    bodyRoute.add(r);
  }

  void switchBody(String r){
    bodyRoute.add(r);
  }

  void backBody(){
    bodyRoute.removeLast();
  }
}