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

  String _nombre =
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
