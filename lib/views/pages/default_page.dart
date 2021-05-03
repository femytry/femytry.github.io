import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/page_route_controller.dart';
import 'package:portfolio/utils/consts.dart';
import 'package:portfolio/views/pages/profile/profile_page.dart';
import 'package:portfolio/views/pages/works/works_page.dart';
import 'package:portfolio/views/widgets/responsive_widget.dart';

class DefaultPage extends StatefulWidget {
  final String? page;

  DefaultPage({Key? key, this.page}) : super(key: key);

  @override
  _DefaultPageState createState() => _DefaultPageState(page ?? '/profile');
}

class _DefaultPageState extends State<DefaultPage> {
  final String page;

  _DefaultPageState(this.page);

  final PageRouteController _controller = Get.find();
  var _body = {
    '/profile': ProfilePage(),
    '/works': WorksPage(),
  };

  @override
  Widget build(BuildContext context) {
    _controller.initBody(page);
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen()
          ? AppBar(
              title: Text("Femy Try Kurnia"),
            )
          : PreferredSize(
              child: Container(
                height: 50,
                color: COLORS.LIGHT_BG,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(() {
                    var b = _controller.bodyRoute.last;
                    return Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _controller.backPage();
                            },
                            child: Text(
                              "Femy Try Kurnia",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: () {
                              if (b != '/works') {
                                _controller.switchBody('/works');
                              }
                            },
                            child: Text(
                              "Projects",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              if (b != '/profile') {
                                _controller.switchBody('/profile');
                              }
                            },
                            child: Text(
                              "About",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                      ],
                    );
                  }),
                ),
              ),
              preferredSize: Size(Get.width, 50),
            ),
      body: Obx(() {
        var k = _controller.bodyRoute.last;
        return AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: _body[k] ?? ProfilePage(),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInOutBack,
        );
      }),
    );
  }
}
