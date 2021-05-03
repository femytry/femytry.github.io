import 'dart:html';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/phone_controller.dart';
import 'package:portfolio/views/pages/welcome/phone_content.dart';
import 'package:portfolio/views/widgets/phone_widget.dart';
import 'package:portfolio/views/widgets/responsive_widget.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PhoneController _phoneController = Get.find();
  final List<Widget> _phoneContent = [
    PhoneContentAvatar(), PhoneContentMenu()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ResponsiveWidget(
            largeScreen: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: _phone(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi there! Meet me Femy.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "If you want to know more about me, please click the app.",
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                            child: InkWell(child: SvgPicture.asset('assets/svg/linkedin.svg', width: 30,), onTap: () {
                              js.context.callMethod('open', ['https://www.linkedin.com/in/femy-try/']);
                            },),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(child: SvgPicture.asset('assets/svg/github.svg', width: 30,), onTap: () {
                              js.context.callMethod('open', ['https://github.com/femytry']);
                            },),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(child: SvgPicture.asset('assets/svg/instagram.svg', width: 30,), onTap: () {
                              js.context.callMethod('open', ['https://www.instagram.com/tryfemy']);
                            },),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(child: SvgPicture.asset('assets/svg/facebook.svg', width: 30,), onTap: () {
                              js.context.callMethod('open', ['https://facebook.com/femy.t.kurnia/']);
                            },),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            smallScreen: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _phone(),
                Text(
                  "If you want to know more about me, please click the app.",
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                      child: InkWell(child: SvgPicture.asset('assets/svg/linkedin.svg', width: 30,), onTap: () {
                        js.context.callMethod('open', ['https://www.linkedin.com/in/femy-try/']);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(child: SvgPicture.asset('assets/svg/github.svg', width: 30,), onTap: () {
                        js.context.callMethod('open', ['https://github.com/femytry']);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(child: SvgPicture.asset('assets/svg/instagram.svg', width: 30,), onTap: () {
                        js.context.callMethod('open', ['https://www.instagram.com/tryfemy']);
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(child: SvgPicture.asset('assets/svg/facebook.svg', width: 30,), onTap: () {
                        js.context.callMethod('open', ['https://facebook.com/femy.t.kurnia/']);
                      },),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _phone() => PhoneWidget(
    content: Obx(() {
      var w = _phoneController.phoneContent.value;
      return AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: _phoneContent[w],
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInOutBack,
      );
    }),
  );
}
