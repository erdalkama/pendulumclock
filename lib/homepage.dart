// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  var animation;
  late AnimationController animationController;

  _currentTime() {
    return DateTime.now().toString().substring(10,19);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      } else if (animationController.isDismissed) {
        animationController.forward();
      }
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = Tween(begin: -0.8, end: 0.8).animate(animation);

    return Scaffold(
      appBar: AppBar(
        title: const Text("PENDULUM CLOCK"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 125, 128),
        elevation: 0.0,
        actions: <Widget>[
            IconButton(
              onPressed: () {
                _urlAcma(Platform.isAndroid
                    ? "https://play.google.com/store/apps/details?id=com.application.pendulumclock"
                    : "");
              },
              icon: const Icon(Icons.star),
              tooltip: 'Puan Ver',
            ),
            IconButton(
              onPressed: () {
                Share.share(
                    """Have you downloaded Pendulum Clock?\nGoogle Play Store: https://play.google.com/store/apps/details?id=com.application.pendulumclock\nApp Store: """);
              },
              icon: const Icon(Icons.share),
              tooltip: 'Paylaş',
            ),
          ]
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 23.0),
        color: const Color.fromARGB(255, 37, 34, 35),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: <Widget>[
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(160.0)),
                elevation: 10.0,
                color: const Color.fromARGB(255, 126, 125, 128),
                child: SizedBox(
                  width: 320,
                  height: 320,
                  child: Center(
                    child: Text(
                      _currentTime(),
                      style: const TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Transform(
                alignment: const FractionalOffset(0.5, 0.1),
                transform: Matrix4.rotationZ(animation.value),
                child: Image.asset(
                  'assets/pandulum.png',
                  width: 100,
                  height: 250,
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
Future _urlAcma(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    debugPrint('');
  }
}