import 'package:firstflutterapp/adopt_app/bloc/animal_bloc.dart';
import 'package:firstflutterapp/adopt_app/widget/adopt_appbar.dart';
import 'package:firstflutterapp/adopt_app/widget/adopt_filter.dart';
import 'package:firstflutterapp/adopt_app/widget/adopt_list.dart';
import 'package:firstflutterapp/adopt_app/favorite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptAppPage extends StatelessWidget {
  const AdoptAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AnimalBloc>()..add(LoadAnimals()),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBE8DF),
      body: const Column(
        children: [
          AdoptAppBarWidget(),
          AdoptFilterWidget(),
          AdoptListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
            try {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritePage(),
                ),
              );
            } catch (e) {
              debugPrint('Error al navegar: $e');
            }
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




// backgroundColor: #DBE8DF
// orange: #EE6D2D
// brown: #3C2F20
// brownLight: #8E8E81
// blueLight: #91C9B9
