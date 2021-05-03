import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/widgets/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          largeScreen: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (Get.width * 0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/img/profile.jpg'),
                              radius: 100,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 500, minWidth: 200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Summary', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                                SizedBox(height: 10,),
                                Text("Hi, I'm Femy Try Kurnia. App Developer who focused on mobile app development. Have more than 2 years professional experience in the same field. Began with android native app development using java/kotlin and now using flutter to develop multiplatform app."),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Works', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                          SizedBox(height: 20,),
                          workContainer('Mobile App Developer', 'Team Elite(Freelance)', 'Sept 2019', 'Present', 'Bandung, Indonesia'),
                          SizedBox(height: 10,),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 10,),
                          workContainer('Android App Developer', 'Mahkota Digital Indonesia', 'Nov 2019', 'Aug 2020', 'Bandung, Indonesia'),
                          SizedBox(height: 10,),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(height: 10,),
                          workContainer('Android App Developer', 'Asia Digital Indonesia', 'Mar 2019', 'Oct 2019', 'Bandung, Indonesia'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Education', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                          SizedBox(height: 20,),
                          educationContainer('Telkom University', 'Associate Degree(Diploma 3)', 'Software Engineering', '2015', '2018', 'Bandung, Indonesia')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(child: Text("© ${DateTime.now().year} Femy Try Kurnia | Hosted on Github Pages | Made using Flutter Web", textAlign: TextAlign.center, style: TextStyle(fontSize: 12),)),
                  SizedBox(height: 16,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget workContainer(String title, String company, String from, String to, String location){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        Text(company, style: TextStyle(fontWeight: FontWeight.w600),),
        Text('$from - $to'),
        Text(location)
      ],
    );
  }

  Widget educationContainer(String school, String degree, String major, String from, String to, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(school, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        Text('$degree - $major', style: TextStyle(fontWeight: FontWeight.w600),),
        Text('$from - $to'),
        Text(location)
      ],
    );
  }
}


