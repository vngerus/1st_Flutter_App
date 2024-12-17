import 'package:firstflutterapp/audio_player/audio_info.dart';
import 'package:firstflutterapp/audio_player/audio_player.dart';
import 'package:firstflutterapp/bdd/indata.dart';
import 'package:firstflutterapp/galeria_imgs/galeria_imgs.dart';
import 'package:firstflutterapp/home_hab.dart';
import 'package:firstflutterapp/todo_bloc/bloc/todo_bloc.dart';
import 'package:firstflutterapp/todo_bloc/todo_bloc_page.dart';
import 'package:firstflutterapp/todo_provider/todo_provider.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeHabitosPage(),
                  ),
                );
              },
              child: const Text("Gestor de Hábitos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InData(),
                  ),
                );
              },
              child: const Text("Widgets de entrada de datos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GaleriaImgs(),
                  ),
                );
              },
              child: const Text("Galería de Imágenes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AudioPlayerPage(),
                  ),
                );
              },
              child: const Text("Reproductor de Audio"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AudioPlayer2(),
                  ),
                );
              },
              child: const Text("Reproductor de Audio 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoProvider(),
                  ),
                );
              },
              child: const Text("Todo - Provider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoBlocPage(),
                  ),
                );
              },
              child: const Text("Todo - Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
