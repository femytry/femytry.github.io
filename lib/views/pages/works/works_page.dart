import 'dart:html';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/widgets/default_appbar.dart';
import 'package:portfolio/views/widgets/responsive_widget.dart';

class WorksPage extends StatelessWidget {
  static const String route = '/works';
  final double padding = Get.width * 0.1;

  final List<ProjectItem> items = [
    ProjectItem('Wa Marketing', '', '0',
        'Marketing tools using whatsapp developed using flutter', ''),
    ProjectItem(
        'MySuzuki',
        'assets/img/mysuzuki.png',
        '1',
        'E-commerce sparepart suzuki developed using flutter',
        'https://apps.apple.com/id/app/my-suzuki/id1449817949'),
    ProjectItem('Waroenk Amak', '', '2', 'Marketplace for UMKM', ''),
    ProjectItem(
        'Sembilan Kita',
        'assets/img/9kita.png',
        '1',
        'App to order Massage & Cleaning Service developed using android native(kotlin)',
        'https://play.google.com/store/apps/details?id=com.teamelite.sembilankita&hl=en_US&gl=US'),
    ProjectItem(
        'Real Travel',
        'assets/img/reltravel.png',
        '1',
        'Umroh Tour & Travel App developed using android native(kotlin & Java)',
        'https://play.google.com/store/apps/details?id=com.teameite.realtravel&hl=en_US'),
    ProjectItem(
        'Syirkahmu',
        'assets/img/syirkah.png',
        '2',
        'Syirkah App(Koperasi Syariah) developed using android native(kotlin)',
        'https://play.google.com/store/apps/details?id=com.teamelite.syirkahmu&hl=en_US&gl=US'),
    ProjectItem(
        'Gomasgo',
        'assets/img/gomasgo.png',
        '1',
        'Umroh Tour marketing purpose app developed using android native(java)',
        'https://play.google.com/store/apps/details?id=space.tryagain.gomasgo&hl=en_US&gl=US'),
  ];

  @override
  Widget build(BuildContext context) {
    var crossCount = 3;
    double ratio = 1.5;
    if (ResponsiveWidget.isSmallScreen()) {
      crossCount = 1;
      ratio = 1.15;
    } else if (ResponsiveWidget.isMediumScreen()) {
      crossCount = 2;
      ratio = 1.2;
    }
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen()
          ? DefaultSmallAppbar("Femy Try Kurnia")
          : DefaultLargeAppbar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        EdgeInsets.only(left: padding, top: 20, right: padding),
                    child: Text(
                      'Projects',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
              sliver: SliverGrid.count(
                crossAxisCount: crossCount,
                childAspectRatio: ratio,
                children: List.generate(
                  items.length,
                  (index) => _gridItem(items[index]),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
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
            )
          ],
        ),
      ),
    );
  }

  Widget _gridItem(ProjectItem item) {
    double height = 100;
    var color = Colors.green;
    var status = 'Completed';
    if (item.status == '0') {
      color = Colors.yellow;
      status = 'On Progress';
    } else if (item.status == '1') {
      color = Colors.green;
      status = 'Completed';
    } else {
      color = Colors.red;
      status = 'On Hold/Abandoned';
    }
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Stack(
                children: [
                  if (item.image.isNotEmpty) ...[
                    Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      height: height,
                      width: double.infinity,
                    ),
                  ] else ...[
                    Container(
                      width: double.infinity,
                      height: height,
                      color: Colors.grey,
                    )
                  ],
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        status,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(item.simpleDesc),
            Expanded(child: Container()),
            if (item.link.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      js.context.callMethod('open', [item.link]);
                    },
                    child: Text('View App'),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class ProjectItem {
  String title, image, status, simpleDesc, link;

  ProjectItem(this.title, this.image, this.status, this.simpleDesc, this.link);
}
