import 'package:flutter/material.dart';

class GaleriaImgs extends StatefulWidget {
  const GaleriaImgs({super.key});

  @override
  State<GaleriaImgs> createState() => _GaleriaImgsState();
}

class _GaleriaImgsState extends State<GaleriaImgs> {
  final List<String> imgUrls = [
    "https://placecats.com/300/202",
    "https://placecats.com/300/203",
    "https://placecats.com/300/204",
    "https://placecats.com/300/205",
    "https://placecats.com/300/207",
  ];

  int crossAxisCount = 2;

  addImage() {
    int lastIndex = int.parse(imgUrls.last.split("/")[4]);
    setState(() {
      imgUrls.add("https://placecats.com/300/${lastIndex + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF275846),
      body: Column(
        children: [
          SafeArea(child: SizedBox.shrink()),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: headerSection(context),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: size.width,
              child: textSextion(),
            ),
          ),
          const SizedBox(height: 36),
          bodySection()
        ],
      ),
    );
  }

  Widget headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 34,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white38,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            addImage();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget textSextion() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Gallery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Created 2 days ago...",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget bodySection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently Added",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          crossAxisCount = 2;
                        });
                      },
                      child: const Icon(Icons.grid_view),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          crossAxisCount = 3;
                        });
                      },
                      child: const Icon(Icons.grid_on_sharp),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                itemCount: imgUrls.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                image: NetworkImage(imgUrls[i]),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity,
                            height: 300,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: NetworkImage(imgUrls[i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Ejercicio 1:
// - Agregar las imagenes (que sean visibles)
// - Que las imagenes tengan el borde redondeado
// - Que aparezca en la galeria, la imagen agregada desde el boton
// del AppBar

// Ejercicio 2:
//- Modifiicar la cantidad de elementos en la grilla
// - Ver La imagen (Al hacer Click) :
// Dialog
// Navigator

class ImageView extends StatelessWidget {
  final String imgUrl;

  const ImageView({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
