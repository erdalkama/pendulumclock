import 'package:flutter/material.dart';

import 'developer.dart';

List<String> developers = [
  "HAKAN BAKACAK\nhakanbakacak98@gmail.com",
  "ERDAL KAMA\nerdalkama@hotmail.com",
];

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 37, 34, 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('DEVELOPERS'),
            centerTitle: true,
           backgroundColor: const Color.fromARGB(255, 126, 125, 128),
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: developers.length,
            itemBuilder: (BuildContext context, int pozisyon) {
              return Developer(
                developer: developers[pozisyon],
              );
            },
          ),
          )
        ],
      ),
    );
  }
}
