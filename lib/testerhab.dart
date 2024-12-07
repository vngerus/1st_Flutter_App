import 'dart:developer';
import 'package:firstflutterapp/new_habit.dart';
import 'package:flutter/material.dart';

class HomeHabitosPage extends StatefulWidget {
  const HomeHabitosPage({super.key});

  @override
  State<HomeHabitosPage> createState() => _HomeHabitosPageState();
}

class _HomeHabitosPageState extends State<HomeHabitosPage> {
  final List<Habit> habits = [];

  void _addHabit(String name, String desc) {
    setState(() {
      habits.add(Habit(name: name, description: desc));
    });
    log(habits.toString());
  }

  void changeStatus(int i) {
    setState(() {
      habits[i].isComplete = !habits[i].isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de hábitos"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, i) {
            String name = habits[i].name;
            String desc = habits[i].description;
            bool isComplete = habits[i].isComplete;

            return ListTile(
              onTap: () => changeStatus(i),
              title: Text(name),
              subtitle: Text(desc),
              trailing: isComplete
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.circle_outlined),
            );
          },
        ),
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
