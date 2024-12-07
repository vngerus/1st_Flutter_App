# Ejercicios y Comandos Útiles en Flutter

Este repositorio contiene una serie de ejemplos y ejercicios prácticos para aprender y explorar Flutter. A continuación, se incluye un índice de los contenidos y los fragmentos de código acompañados de explicaciones detalladas.

---

## Índice

1. [Fundamentos de Dart](#fundamentos-de-dart)
2. [Widgets Personalizados](#widgets-personalizados)
3. [Gestión de Estados](#gestión-de-estados)
4. [Calculadora Básica](#calculadora-básica)
5. [Navegación en Flutter](#navegación-en-flutter)
6. [Habitos en Flutter] (#habitos-en-flutter)
7. [Comandos Útiles de Flutter](#comandos-útiles-de-flutter)

---

## Fundamentos de Dart

<details>
<summary><code>Fundamentos</code></summary>

```js
void main() {
  //print("hola mundo");
  //variables();
  //listaYmapa();
  //operador();
  //saludar("Nicole", "Szboslai");
  //saludar2(nombre: "Nikola2", apellido: "Szboslaina2");
  //saludar2(nombre: "Nikola3", apellido: "Szboslaina3");

  //Alumns alumno = Alumns(name: "A", id: 1);
  //print(alumno.name);

  clima();
  obtenerClima();
}

abstract class Animal {
  void sonido() => print("Hacer sonido");
}

class Gato extends Animal {
  @override
  void sonido() => print("Prr si te miro por la calle digo prr");
}

class Navidad extends Animal {
  @override
  void sonido() => print("Felz navidad para todos ustedes jingle bell");
}

class Alumns {
  final String name;
  final int id;

  Alumns({required this.name, required this.id});

  @override
  String toString() {
    return "Nombre: $name ($id)";
  }
}

void variables() {
  var ciudad = "Santiago";
  var temp = 38.0;

  int edad = 90;
  double altura = 75.2;
  bool esEstudiante = true;
  String nombre = "Sofia";

  String nombre0 =
      "Sofia"; //Al usar un _ dart la reconoce automaticamente como privada.

  print(ciudad);
  print(edad);
  print(altura);
  print(esEstudiante);
  print(nombre);
}

void listaYmapa() {
  List<String> comidas = ["Arroz", "Huevos", "Kimchi"];
  Map<String, Object> alumnos = {
    "Loreto": 1,
    "Rodrigo": 2,
  };
}

void operador() {
  int a = 10;
  int b = 3;

  print(a + b); // Suma
  print(a - b); // Resta
  print(a * b); // Multiplicación
  print(a / b); // División
  print(a % b); // Módulo

  print(a > b); // Mayor que
  print(a >= b); // Mayor o igual que
  print(a == b); // Igual a
  print(a != b); // Diferente de
}

void control() {
  int edad = 18;
  if (edad >= 18) {
    print("Mayor de edad");
  } else {
    print("Menor de edad");
  }

  String diaSemana = "Martes";

  // switch
  switch (diaSemana) {
    case "Lunes":
      print("Es Lunes");
      break;
    case "Martes":
      print("Es Martes");
      break;
    default:
      print("Otro día x");
  }

  // for, for in, while
  for (int i = 1; i <= 5; i++) {
    print("numero: $i");
  }

  for (var element in [1, 2, 3, 4]) {
    print("numero: $element");
  }

  int count = 1;
  while (count <= 5) {
    print("contador: $count");
    count++;
  }
}

void saludar(String nombre, [String apellido = ""]) {
  print("Hola, $nombre $apellido");
}

void saludar2({required String nombre, String apellido = ""}) {
  print("Hola, $nombre $apellido");
}

void saludar3({required String nombre, required String apellido}) {
  print("Hola, $nombre $apellido");
}

Future<String> clima() async {
  await Future.delayed(const Duration(seconds: 3));
  return "El clima actual es de 34°";
}

Future<String> obtenerClima() async {
  String datosClima = await clima();
  print(datosClima);
  return datosClima;
}
```

</details>

### Explicación

El archivo `fundamentos.dart` incluye conceptos básicos de Dart como variables, estructuras de control, listas y mapas. Además, se muestra cómo definir clases y funciones asíncronas.

---

## Widgets Personalizados

<details>
<summary><code>Widgets</code></summary>

```js

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final String titulo = "Widgets Flutter";

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    //bool isAndroid = Platform.isAndroid;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [FlutterLogo()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        /* body: const Column(
          children: [
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                color: Color(0xFFFF9005),
              ),
            ),
            Text(
              "Texto de ejemplo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
          ],
        ), */
        /* body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 16,
                bottom: isAndroid ? 16 : 50,
                child: myButtonFloating(),
              ),
            ],
          ),
        ), */
        body: const MisWidgets(),
      ),
    );
  }

  Widget myButtonFloating() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

// FloatingActionButtonPersonalizado
Widget myButtonFloating() {
  return FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  );
}

class MisWidgets extends StatelessWidget {
  const MisWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Mis Widgets Básicos"),
        Wrap(
          spacing: 8,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            const SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        Container(
          color: Colors.yellow,
          width: 200,
          height: 180,
          child: Image.network(
            "https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.yellow,
          width: 200,
          height: 180,
          child: Image.asset(
            "assets/img/bird.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: GestureDetector(
            onTap: () => print("Se presiona el boton"),
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text("OutlinedButton"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}


```

</details>

### Explicación

En este archivo (`my_widgets.dart`), se exploran widgets básicos como `ElevatedButton`, `OutlinedButton` y `IconButton`. También se muestra cómo incluir imágenes y personalizar gestos.

---

## Gestión de Estados

<details>
<summary><code>Estados</code></summary>

```js
import 'dart:developer';

import 'package:flutter/material.dart';

class Estados extends StatefulWidget {
  const Estados({super.key});

  @override
  State<Estados> createState() => _EstadosState();
}

class _EstadosState extends State<Estados> {
  int contador = 0;

  @override
  void initState() {
    log("Initstate()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("build()");
    log("contador: $contador");
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Contador: $contador",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            contador++;
                          });
                        },
                        child: const Text("Incrementar"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            contador--;
                          });
                        },
                        child: const Text("Decrementar"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

</details>

### Explicación

Este ejemplo (`estados.dart`) muestra cómo gestionar el estado de los widgets en Flutter utilizando la función `setState()`.

---

## Calculadora Básica

<details>
<summary><code>Calculadora</code></summary>

```js
import 'dart:io';

void main() {
  // Mostrar las opciones del menú al usuario
  // 1: Suma
  // 2: Resta
  // 3: Multiplicación
  // 4: División
  print("===== Calculadora =====");
  print("1: Suma");
  print("2: Resta");
  print("3: Multiplicación");
  print("4: División");

//print(opcion);
// 1: Obtener la opción ingresa
// 2: Solicitar el primer número
// 3: Solciitar el segundo número
// 4: Ejecutar la operación lógica y mostrar el resultado
  stderr.write("Ingresa una opción: ");
  int opcion = int.parse(stdin.readLineSync()!);

  if (opcion < 1 || opcion > 4) {
    print("Opción no válida. Intenta nuevamente.");
    return;
  }

  stderr.write("Ingresa el primer número: ");
  double num1 = double.parse(stdin.readLineSync()!);

  stderr.write("Ingresa el segundo número: ");
  double num2 = double.parse(stdin.readLineSync()!);

  switch (opcion) {
    case 1:
      print("Resultado de la suma: ${suma(num1, num2)}");
      break;
    case 2:
      print("Resultado de la resta: ${resta(num1, num2)}");
      break;
    case 3:
      print("Resultado de la multiplicación: ${multiplicacion(num1, num2)}");
      break;
    case 4:
      if (num2 == 0) {
        print("Error: No se puede dividir por cero.");
      } else {
        print("Resultado de la división: ${division(num1, num2)}");
      }
      break;
  }
}

double suma(double a, double b) => a + b;

double resta(double a, double b) => a - b;

double multiplicacion(double a, double b) => a * b;

double division(double a, double b) => a / b;

```

</details>

### Explicación

El archivo `calculadora.dart` implementa una calculadora de consola que permite realizar operaciones básicas.

---

## Navegación en Flutter

### main.dart

<details>
<summary><code>Navegación</code></summary>

```js
import 'package:firstflutterapp/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Menu(),
    ),
  );
}

```

</details>

### menu.dart

<details>
<summary><code>Menú</code></summary>

```js
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

```

</details>

### page1.dart

<details>
<summary><code>Page 1</code></summary>

```js
import 'package:firstflutterapp/clases/nav/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pagina 1"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Page2(
                product: 'Monitor',
              ),
            ),
          );
        },
        child: const Text("Ir a la página 2"),
      ),
    );
  }
}

```

</details>

### page2.dart

<details>
<summary><code>Page 2</code></summary>

```js
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String product;

  const Page2({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Producto $product"),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Volver"),
      ),
    );
  }
}

```

</details>

### Habitos en Flutter

<details>
<summary><code>Home_hab.dart</code></summary>

```js
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

  // Escritura de datos
  // Lectura de datos
  // InitStte -> leer si tenemos información almacenada

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

```

</details>

<details>
<summary><code>New_habit.dart</code></summary>

```js
import 'package:flutter/material.dart';

class NewHabit extends StatefulWidget {
  final Function(String, String) submitHabit;

  const NewHabit({super.key, required this.submitHabit});

  @override
  State<NewHabit> createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  void submit() {
    final name = _nameController.text;
    final desc = _desController.text;

    if (name.isNotEmpty && desc.isNotEmpty) {
      widget.submitHabit(name, desc);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo hábito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nombre del hábito",
              ),
            ),
            TextField(
              controller: _desController,
              decoration: const InputDecoration(
                labelText: "Descripción",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: const Text("Añadir"),
            ),
          ],
        ),
      ),
    );
  }
}


```

</details>

### Explicación

En este apartado se detalla cómo implementar la navegación entre pantallas en Flutter, utilizando `Navigator.push` y `Navigator.pop`.

---

# Comandos útiles de Flutter

1. **`flutter run`**  
   Ejecuta tu aplicación Flutter en un dispositivo conectado o emulador.  
   Si hay más de un dispositivo, te pedirá que elijas.

   ```bash
   flutter run
   ```

2. **`flutter upgrade`**  
   Actualiza Flutter a la última versión disponible en el canal actual (estable, beta, dev).

   ```bash
   flutter upgrade
   ```

3. **`flutter --version`**  
   Muestra la versión actual de Flutter instalada en tu sistema.

   ```bash
   flutter --version
   ```

4. **`flutter devices`**  
   Lista los dispositivos disponibles (físicos o emuladores) en los que puedes ejecutar tu app.

   ```bash
   flutter devices
   ```

5. **`flutter build apk --release`**  
   Genera un APK optimizado para producción.

   ```bash
   flutter build apk --release
   ```

6. **`flutter build appbundle --release`**  
   Genera un **App Bundle** optimizado para subir a la Play Store.

   ```bash
   flutter build appbundle --release
   ```

7. **`flutter build ios --release`**  
   Genera una versión optimizada para producción en dispositivos iOS.  
   **Nota:** Necesitarás un entorno macOS con Xcode configurado.

   ```bash
   flutter build ios --release
   ```

8. **`flutter pub get`**  
   Descarga e instala las dependencias especificadas en el archivo `pubspec.yaml`.

   ```bash
   flutter pub get
   ```

---

### Librerías de recursos

1. Encuentra más paquetes y librerías en [pub.dev](https://pub.dev/).

### Explicación

Incluye comandos esenciales para trabajar con Flutter, como la ejecución de aplicaciones, actualización del SDK y generación de APKs.

---
