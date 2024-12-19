import 'package:firstflutterapp/adopt_app/bloc/animal_bloc.dart';
import 'package:firstflutterapp/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AnimalBloc(),
      child: const MaterialApp(
        home: Menu(),
      ),
    ),
  );
}
