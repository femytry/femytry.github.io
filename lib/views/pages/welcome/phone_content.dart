import 'dart:html';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/phone_controller.dart';
import 'package:portfolio/views/pages/profile/profile_page.dart';

class PhoneContentAvatar extends StatefulWidget {
  PhoneContentAvatar({Key? key}) : super(key: key);

  @override
  _PhoneContentAvatarState createState() => _PhoneContentAvatarState();
}

class _PhoneContentAvatarState extends State<PhoneContentAvatar>
    with SingleTickerProviderStateMixin {
  final PhoneController _phoneController = Get.find();

  late final AnimationController _avatarController;
  final Duration _avatarDuration = Duration(seconds: 1);
  final Tween<double> _avatarAnimation = Tween(begin: 1, end: 0.9);

  @override
  void initState() {
    super.initState();
    _avatarController =
        AnimationController(vsync: this, duration: _avatarDuration);
    _avatarController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTransition(
          child: CircleAvatar(
            foregroundImage: AssetImage('assets/img/developer_avatar.png'),
            radius: 60,
            backgroundColor: Get.theme.primaryColorDark,
          ),
          scale: _avatarAnimation.animate(
              CurvedAnimation(parent: _avatarController, curve: Curves.ease)),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              _phoneController.switchPhoneContent(1);
            },
            child: Text("Know More"))
      ],
    );
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }
}

class PhoneContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('What you want to know about me?', style: TextStyle(fontSize: 20, fontWeight:  FontWeight.w600),),
          SizedBox(height: 40,),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(()=> ProfilePage());
              },
              icon: Icon(Icons.person_rounded),
              label: Text('Profile'),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.work_rounded),
              label: Text('Projects'),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                js.context.callMethod('open', ['mailto:tryfemy@gmail.com']);
              },
              icon: Icon(Icons.mail_rounded),
              label: Text('Contact Me'),
            ),
          ),
        ],
      ),
    );
  }
}
