import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .45;

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Recently Played",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                height: imgHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/catdivision.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              songInfo(),
              audioControls(size),
              const SizedBox(height: 20),
              lyricsInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget songInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Meowsorder',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 1),
        const Text(
          'Meowdivision',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget audioControls(Size size) {
    double percentage = size.width * .4;

    Widget timeSlider() {
      return SizedBox(
        width: size.width,
        height: 10,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: size.width,
              height: 4,
              color: Colors.white,
            ),
            Container(
              width: percentage,
              height: 4,
              color: const Color(0xFF643CEB),
            ),
            Positioned(
              left: percentage,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF643CEB),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Column(
          children: [
            timeSlider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "8:30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "-2:30",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            Icon(
              Icons.skip_previous_rounded,
              color: Colors.white,
              size: 28,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {},
                icon: const Icon(
                  Icons.pause,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 28,
            ),
            Icon(
              Icons.repeat,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }

  Widget lyricsInfo() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF302F42),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Lyrics',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.open_in_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.open_in_full,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "What means to you,\n",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: "what means to me\n",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text:
                            "And we will meet again\nI'm watching you, I'm watching",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
