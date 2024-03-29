import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/widgets/default_appbar.dart';
import 'package:portfolio/views/widgets/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  static const String route = '/resume';

  @override
  Widget build(BuildContext context) {
    double padding = Get.width * 0.1;
    if (ResponsiveWidget.isLargeScreen()) {
      padding = Get.width * 0.2;
    }
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen()
          ? DefaultSmallAppbar("Femy Try Kurnia")
          : DefaultLargeAppbar(),
      body: SafeArea(
        child: ResponsiveWidget(
          largeScreen: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/img/profile.png'),
                              radius: 100,
                            ),
                          ),
                          Text(
                            'Summary',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Hi, I'm Femy Try Kurnia. App Developer who focused on mobile app development. Have more than 2 years professional experience in the same field. Began with android native app development using java/kotlin and now using flutter to develop multiplatform app."),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Works',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          workContainer(
                              'Mobile App Developer',
                              'Team Elite(Freelance)',
                              'Sept 2019',
                              'Present',
                              'Bandung, Indonesia'),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          workContainer(
                              'Android App Developer',
                              'Mahkota Digital Indonesia',
                              'Nov 2019',
                              'Aug 2020',
                              'Bandung, Indonesia'),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          workContainer(
                              'Android App Developer',
                              'Asia Digital Indonesia',
                              'Mar 2019',
                              'Oct 2019',
                              'Bandung, Indonesia'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Education',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          educationContainer(
                              'Telkom University',
                              'Associate Degree(Diploma 3)',
                              'Software Engineering',
                              '2015',
                              '2018',
                              'Bandung, Indonesia')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    "© ${DateTime.now().year} Femy Try Kurnia | Hosted on Github Pages | Made using Flutter Web",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget workContainer(
      String title, String company, String from, String to, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          company,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('$from - $to'),
        Text(location)
      ],
    );
  }

  Widget educationContainer(String school, String degree, String major,
      String from, String to, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          school,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          '$degree - $major',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text('$from - $to'),
        Text(location)
      ],
    );
  }
}
