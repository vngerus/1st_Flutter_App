import 'package:firstflutterapp/new_habit.dart';
import 'package:flutter/material.dart';

class HomeHabitosPage extends StatelessWidget {
  final List<Habit> habits = [];

  void _addHabit(String name, String desc) {
    habits.add(
      Habit(
        name: name,
        description: desc,
      ),
    );
    print(habits.toList());
  }

  HomeHabitosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de hábitos"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Mi hábito A"),
            subtitle: Text("descripción"),
            trailing: Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewHabit(
                submitHabit: _addHabit,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Habit {
  String name;
  String description;
  bool isComplete;

  Habit({
    required this.name,
    required this.description,
    this.isComplete = false,
  });

  @override
  String toString() {
    return "name: $name, description: $description, isComplete: $isComplete";
  }
}
