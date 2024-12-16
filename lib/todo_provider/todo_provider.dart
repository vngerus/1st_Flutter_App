import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void updateStatus(int i) {
    _tasks[i].isComplete = !_tasks[i].isComplete;
    notifyListeners();
  }
}

class Task {
  String title;
  bool isComplete;

  Task({
    required this.title,
    this.isComplete = false,
  });
}

class TodoProvider extends StatelessWidget {
  const TodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Provider"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length, // Usar el getter
              itemBuilder: (BuildContext context, int i) {
                final task = taskProvider.tasks[i]; // Usar el getter

                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Checkbox(
                    value: task.isComplete,
                    onChanged: (value) => taskProvider.updateStatus(i),
                  ),
                );
              },
            ),
          ),
          TodoInputText(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class TodoInputText extends StatelessWidget {
  final TextEditingController _ctrl = TextEditingController();

  TodoInputText({super.key});

  void _addTask(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    if (_ctrl.text.isNotEmpty) {
      taskProvider.addTask(_ctrl.text);
      _ctrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _ctrl,
            decoration: const InputDecoration(labelText: "Nueva Tarea"),
          ),
        ),
        ElevatedButton(
          onPressed: () => _addTask(context),
          child: const Text("Agregar"),
        ),
      ],
    );
  }
}
