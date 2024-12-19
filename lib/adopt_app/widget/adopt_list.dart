import 'package:firstflutterapp/adopt_app/bloc/animal_bloc.dart';
import 'package:firstflutterapp/clases/fundamentos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptListWidget extends StatelessWidget {
  const AdoptListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          bottom: 48,
        ),
        child: BlocBuilder<AnimalBloc, AnimalState>(
          builder: (context, state) {
            if (state.pageState == AnimalPageState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.pageState == AnimalPageState.failure) {
              return const Center(child: Text("Error al obtener la data"));
            } else if (state.pageState == AnimalPageState.success) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.filteredAnimals.length,
                itemBuilder: (BuildContext context, int i) {
                  final animal = state.filteredAnimals[i];
                  return buildCard(
                    animalId: animal.id,
                    name: animal.name,
                    breed: animal.breed,
                    age: animal.age,
                    isFavorite: animal.isFavorite,
                    context: context,
                  );
                },
              );
            } else {
              return const Center(child: Text("Sin data"));
            }
          },
        ),
      ),
    );
  }

  Widget buildCard({
    required String animalId,
    required String name,
    required String breed,
    required int age,
    required bool isFavorite,
    required BuildContext context,
  }) {
    return Container(
      width: 260,
      height: 300,
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 18,
      ),
      margin: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar
          const CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xFF91C9B9),
          ),
          // Name
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          // Breed
          Text(
            breed,
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Age
          Text(
            "$age years",
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          // Fav
          IconButton(
            onPressed: () {
              context.read<AnimalBloc>().add(
                    ToggleFavorite(animalId),
                  );
            },
            icon: Icon(
              isFavorite ? Icons.favorite_sharp : Icons.favorite_border,
              size: 40,
              color: isFavorite ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
