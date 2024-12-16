import 'package:firstflutterapp/menu.dart';
import 'package:firstflutterapp/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MaterialApp(
        home: Menu(),
      ),
    ),
  );
}
