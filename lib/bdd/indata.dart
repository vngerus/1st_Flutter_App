import 'package:flutter/material.dart';

class InData extends StatefulWidget {
  const InData({super.key});

  @override
  State<InData> createState() => _InDataState();
}

class _InDataState extends State<InData> {
  bool isChecked = false;
  int selectedRadio = 1;
  final Map<int, bool> switches = {1: false, 2: true};

  void toggleSwitch(int key, bool value) {
    setState(() {
      switches[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Datos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) => setState(() => isChecked = value!),
            ),
            Column(
              children: [1, 2].map((value) {
                return Radio<int>(
                  value: value,
                  groupValue: selectedRadio,
                  onChanged: (newValue) =>
                      setState(() => selectedRadio = newValue!),
                );
              }).toList(),
            ),
            Column(
              children: switches.entries.map((entry) {
                return Switch(
                  value: entry.value,
                  onChanged: (value) => toggleSwitch(entry.key, value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
