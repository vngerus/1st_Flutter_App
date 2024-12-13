import 'package:flutter/material.dart';

class AudioPlayer2 extends StatelessWidget {
  const AudioPlayer2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightAppBar = size.height * .15;
    double heightAlbum = size.height * .65;
    double heightContinue = size.height * .2;

    return Scaffold(
      body: Column(
        children: [
          AppBarPlayer(
            height: heightAppBar,
          ),
          AlbumPlayer(
            height: heightAlbum,
          ),
          ContinueWatching(
            height: heightContinue,
          ),
        ],
      ),
    );
  }
}

class AppBarPlayer extends StatelessWidget {
  final double height;

  const AppBarPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.yellow,
    );
  }
}

class AlbumPlayer extends StatelessWidget {
  final double height;

  const AlbumPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      child: Stack(
        children: [
          //Filtros - 90
          Container(
            width: size.width,
            height: 90,
            color: Colors.redAccent,
          ),
          //Carrusel img
          Positioned(
            top: 90,
            child: SizedBox(
              width: size.width,
              height: height - 140,
              child: carruselImages(),
            ),
          ),
          //Slider points - 40
          Positioned(
            bottom: 10,
            left: size.width * .25,
            right: size.width * .25,
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  points(true),
                  points(true),
                  points(true),
                  points(false),
                  points(true),
                  points(true),
                  points(true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget points(bool isCircle) {
    return Container(
      width: isCircle ? 10 : 48,
      height: 10,
      decoration: BoxDecoration(
        color: isCircle ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget carruselImages() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 8,
      ),
      child: Stack(
        children: [
          // Imagen 1 (left)
          Positioned(
            top: 30,
            bottom: 0,
            left: -100,
            child: Transform.rotate(
              angle: -.10,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          // Imagen 2 (right)
          Positioned(
            top: 30,
            bottom: 0,
            right: -100,
            child: Transform.rotate(
              angle: .10,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
          ),
          // Imagen 3 (center)
          Positioned(
            top: 0,
            bottom: 30,
            left: 45,
            right: 45,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContinueWatching extends StatelessWidget {
  final double height;

  const ContinueWatching({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.green,
    );
  }
}
