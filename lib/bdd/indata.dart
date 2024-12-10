import 'package:flutter/material.dart';
import 'dart:developer';

class InData extends StatefulWidget {
  const InData({super.key});

  @override
  State<InData> createState() => _InDataState();
}

class _InDataState extends State<InData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checkValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Datos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nombre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El campo del nombre es obligatorio";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: _checkValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkValue = value!;
                  });
                },
                title: const Text("Acepto los términos y condiciones"),
              ),
              const SizedBox(height: 40),
              /*
              const TextField(
                decoration: InputDecoration(
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                ),
              ),
              */
              // MyCheckbox(),
              // onChanged: (bool? value) {
              //   setState(() {
              //     _checkValue = value!;
              //   });
              // },
              // checkValue: _checkValue,
              // ),
              // Radio<int>(
              //   value: 1,
              //   groupValue: 1,
              //   onChanged: (int? value) {},
              // ),
              // Radio<int>(
              //   value: 2,
              //   groupValue: 1,
              //   onChanged: (int? value) {},
              // ),
              // Switch(
              //   value: true,
              //   onChanged: (bool value) {},
              // ),

              ElevatedButton(
                onPressed: _checkValue
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      }
                    : null,
                child: const Text("Enviar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
