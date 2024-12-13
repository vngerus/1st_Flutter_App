import 'package:flutter/material.dart';

class AudioPlayer2 extends StatelessWidget {
  const AudioPlayer2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightAppBar = size.height * .15;
    double heightAlbum = size.height * .65;
    double heightContinue = size.height * .1326;

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
      bottomNavigationBar: const Menu(),
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
          // Filtros - 90
          Container(
            width: size.width,
            height: 90,
            color: Colors.redAccent,
          ),
          // Carrusel img
          Positioned(
            top: 90,
            child: SizedBox(
              width: size.width,
              height: height - 140,
              child: carruselImages(),
            ),
          ),
          // Slider points - 40
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
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Time to Explore",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "TV Series 2023",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
      color: Colors.red,
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          MenuItem(icon: Icons.home, label: "Home"),
          MenuItem(icon: Icons.star, label: "New"),
          MenuItem(icon: Icons.bookmark, label: "List"),
          MenuItem(icon: Icons.download, label: "Download"),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
