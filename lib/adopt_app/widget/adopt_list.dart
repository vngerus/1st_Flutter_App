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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return buildCard(
                    name: "Murzik",
                    breed: "Maine Coon Cat",
                    age: 3,
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
    required String name,
    required String breed,
    required int age,
  }) {
    return Container(
      width: 260,
      height: 300,
      padding: EdgeInsets.only(
        top: 18,
        bottom: 18,
      ),
      margin: EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar
          CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xFF91C9B9),
          ),
          // Name
          Text(
            name,
            style: TextStyle(
                color: Color(0xFF3C2F20),
                fontSize: 22,
                fontWeight: FontWeight.w800),
          ),
          // Breed
          Text(
            breed,
            style: TextStyle(
                color: Color(0xFF3C2F20),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          // Age
          Text(
            "$age years",
            style: TextStyle(
                color: Color(0xFF3C2F20),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          // Fav
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
