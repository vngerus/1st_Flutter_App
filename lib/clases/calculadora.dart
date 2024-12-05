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
