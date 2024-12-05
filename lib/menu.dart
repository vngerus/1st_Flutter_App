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
              onPressed: () {},
              child: const Text("Gestor de Habitos"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Galería de Imágenes"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Reproductor de Audio"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Todo - Provider"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Todo - Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
