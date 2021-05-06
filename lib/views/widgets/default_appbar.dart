import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/pages/profile/profile_page.dart';
import 'package:portfolio/views/pages/welcome/welcome_page.dart';
import 'package:portfolio/views/pages/works/works_page.dart';

class DefaultLargeAppbar extends PreferredSize {
  DefaultLargeAppbar()
      : super(
          child: Container(
            height: 50,
            color: Get.theme.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  InkWell(
                    child: Text(
                      "Femy Try Kurnia",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      Get.toNamed(WelcomePage.route);
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != ProfilePage.route) {
                        Get.toNamed(ProfilePage.route);
                      }
                    },
                    child: Text(
                      "Resume",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != WorksPage.route) {
                        Get.toNamed(WorksPage.route);
                      }
                    },
                    child: Text(
                      "Projects",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(Get.width, 50),
        );
}

class DefaultSmallAppbar extends AppBar {
  final String textTitle;

  DefaultSmallAppbar(this.textTitle)
      : super(
          backgroundColor: Get.theme.primaryColor,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(WelcomePage.route);
                          },
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        ),
                        ListTile(
                          onTap: () {
                            if (Get.currentRoute != ProfilePage.route) {
                              Get.toNamed(ProfilePage.route);
                            }
                          },
                          leading: Icon(Icons.person_rounded),
                          title: Text("About"),
                        ),
                        ListTile(
                          onTap: () {
                            if (Get.currentRoute != WorksPage.route) {
                              Get.toNamed(WorksPage.route);
                            }
                          },
                          leading: Icon(Icons.work_rounded),
                          title: Text("Projects"),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Get.theme.backgroundColor,
                  barrierColor: Colors.black.withAlpha(90),
                );
              },
            ),
          ],
          title: Text(
            textTitle,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        );
}
