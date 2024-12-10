import 'package:flutter/material.dart';

class GaleriaImgs extends StatelessWidget {
  GaleriaImgs({super.key});

  final List<String> imgUrls = [
    "https://placecats.com/300/200",
    "https://placecats.com/300/200",
    "https://placecats.com/300/200",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Imágenes"),
      ),
      body: Center(
        child: Image.network(
          width: 200,
          height: 300,
          "https://placecats.com/300/200",
        ),
      ),
    );
  }
}


// Mini App de Imagenes
// Grid/Mosaico de imagenes (n)
// Ver la imagen (clickeable)
// modificar la cantidad de elementos en la grilla
// Boton (ui a eleccion ) agregar nueva imagen