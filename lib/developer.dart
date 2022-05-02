import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  final String developer;
  const Developer({Key? key, required this.developer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: const Color.fromARGB(255, 126, 125, 128),
      child: Container(
        height: 120.0,
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: const EdgeInsets.fromLTRB(1.0, 22.0, 1.0, 1.0),
        child: Center(
          child: Text(
            developer,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
