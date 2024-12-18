import 'package:firstflutterapp/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Menu(),
    ), // MaterialApp
    // ChangeNotifierProvider(
    //   create: (_) => TaskProvider(),
    //   child: const MaterialApp(
    //     home: Menu(),
    //   ),
    // ),
  );
}
