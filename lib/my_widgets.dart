import 'dart:io';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final String titulo = "Widgets Flutter";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool isAndroid = Platform.isAndroid;

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [FlutterLogo()],
        ),
/*         body: const Column(
          children: [
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                color: Color(0xFFFF9005),
              ),
            ),
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ), */
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 16,
                bottom: isAndroid ? 16 : 50,
                child: myButtonFloating(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myButtonFloating() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

//FloatingActionButtonPersonalizado