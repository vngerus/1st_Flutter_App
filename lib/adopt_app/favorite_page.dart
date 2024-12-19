import 'package:firstflutterapp/adopt_app/adopt_app.dart';
import 'package:firstflutterapp/adopt_app/bloc/animal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnimalBloc, AnimalState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return const Center(
              child: Text("No hay favoritos aún."),
            );
          }

          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final animal = state.favorites[index];
              return ListTile(
                title: Text(animal.name),
                subtitle: Text(animal.breed),
                trailing: const Icon(Icons.favorite, color: Colors.red),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
