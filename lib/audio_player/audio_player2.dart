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
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Text(
                    "JT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Happy Watching!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "Jayce Talis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
              SizedBox(width: 16),
              Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ],
      ),
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
            child: Filters(),
          ),
          // Carrusel img
          Positioned(
            top: 90,
            child: SizedBox(
              width: size.width,
              height: height - 140,
              child: carruselImages(context),
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

  Widget carruselImages(BuildContext context) {
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
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const AudioInfo(
                    title: "🗣️ Viktor!",
                    description:
                        "Arcane is an adult animated action-adventure series that tells the origin story of two iconic champions from the multiplayer online battle arena (MOBA) game League of Legends",
                    imagePath: "assets/img/viktor.png",
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/img/viktor.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
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
                                  "🗣️ Viktor!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "lol serie",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    size: 40,
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
            ),
          ),
        ],
      ),
    );
  }
}

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filters> {
  String selectedFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _filterSelector("All"),
        _filterSelector("Series"),
        _filterSelector("Movie"),
        _filterSelector("TV Show"),
      ],
    );
  }

  Widget _filterSelector(String label) {
    final bool isSelected = selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.transparent,
          border: isSelected ? Border.all(color: Colors.red[900]!) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class ContinueWatching extends StatelessWidget {
  final double height;

  const ContinueWatching({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    double epdHeight = height * 0.8;
    double epdWidth = epdHeight * 1.5;

    return Container(
      width: double.infinity,
      height: height,
      color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 15,
            child: Row(
              children: const [
                Icon(Icons.double_arrow, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Text(
                  "Continue Watching",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Eps
          Positioned(
            top: height * 0.4,
            left: 0,
            right: 0,
            child: SizedBox(
              height: epdHeight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    _buildEpisodeCard("EP 3", epdWidth, epdWidth),
                    SizedBox(width: 10),
                    _buildEpisodeCard("EP 4", epdWidth, epdWidth),
                    SizedBox(width: 10),
                    _buildEpisodeCard("EP 5", epdWidth, epdWidth),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodeCard(String episode, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            episode,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
          MenuItem(icon: Icons.home_filled, label: "Home"),
          MenuItem(icon: Icons.star_border, label: "New"),
          MenuItem(icon: Icons.bookmark_border, label: "List"),
          MenuItem(icon: Icons.file_download_outlined, label: "Download"),
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

class AudioInfo extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const AudioInfo({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outline,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            child: Image.asset(
                              imagePath,
                              width: double.infinity,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.red,
                            ),
                            label: const Text(
                              "Play S1, E1",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 90,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Column(
                            children: [
                              // Tags
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  _TagChip(label: "2023"),
                                  SizedBox(width: 8),
                                  _TagChip(label: "Flamers, Toxic & GG"),
                                  SizedBox(width: 8),
                                  _TagChip(label: "TV Series"),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  _TagChip(label: "PG"),
                                  SizedBox(width: 8),
                                  _TagChip(label: "4K"),
                                  SizedBox(width: 8),
                                  _TagChip(label: "HD"),
                                  SizedBox(width: 8),
                                  _TagChip(label: "CC"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text(
                        "Cast: Jayce, Viktor, Vi, Jinx, Caitlyn, Ekko, Potatoe, "
                        "Nashor, Roshan, Teemo, Evelyn con pasiva, Shaco.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
      ),
    );
  }
}
