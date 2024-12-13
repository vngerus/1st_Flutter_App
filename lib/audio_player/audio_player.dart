import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('mp3/disorder.mp3'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _toggleLyricsExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double appBarPosition = MediaQuery.of(context).size.height * 0.04;
    final double imgHeight = MediaQuery.of(context).size.height * 0.45;
    final double controlsPosition = MediaQuery.of(context).size.height * 0.02;
    final double lyricsHeight =
        isExpanded ? MediaQuery.of(context).size.height * 0.6 : 150;

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: appBarPosition),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
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
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: imgHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/catdivision.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: controlsPosition),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: songInfo(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: audioControls(),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: lyricsHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF302F42),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: lyricsInfo(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget songInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Meowsorder',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Meow Catvision',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget audioControls() {
    return Column(
      children: [
        Slider(
          value: currentPosition.inSeconds.toDouble(),
          max: totalDuration.inSeconds.toDouble(),
          activeColor: const Color(0xFFBB86FC),
          inactiveColor: Colors.grey,
          onChanged: (value) async {
            final newPosition = Duration(seconds: value.toInt());
            await _audioPlayer.seek(newPosition);
            setState(() {
              currentPosition = newPosition;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDuration(currentPosition),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              _formatDuration(totalDuration),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shuffle,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: _togglePlayPause,
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.repeat,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  Widget lyricsInfo() {
    const List<String> lyrics = [
      "I've been waiting for a guide to come and take me by the hand",
      "Could these sensations make me feel the pleasures of a normal man?",
      "Lose sensations, spare the insults, leave them for another day",
      "I've got the spirit, lose the feeling",
      "Take the shock away",
      "",
      "It's getting faster, moving faster now",
      "It's getting out of hand",
      "On the tenth floor, down the back stairs",
      "It's a no man's land",
      "Lights are flashing, cars are crashing",
      "Getting frequent now",
      "I've got the spirit, lose the feeling",
      "Let it out somehow",
      "",
      "What means to you, what means to me",
      "And we will meet again",
      "I'm watching you, I'm watching",
      "Oh I'll take no pity from your friends",
      "Who is right? Who can tell?",
      "And who gives a damn right now?",
      "Until the spirit new sensation takes hold",
      "Then you know",
      "Until the spirit new sensation takes hold",
      "Then you know",
      "Until the spirit new sensation takes hold",
      "Then you know",
      "",
      "I've got the spirit",
      "But lose the feeling",
      "I've got the spirit",
      "But lose the feeling",
      "Feeling, feeling, feeling, feeling, feeling, feeling, feeling",
    ];

    return Column(
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
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: _toggleLyricsExpansion,
                  icon: Icon(
                    isExpanded ? Icons.close_fullscreen : Icons.open_in_full,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: lyrics
                  .asMap()
                  .entries
                  .map(
                    (entry) => Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: entry.key == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}


// Azul (fondo)   : 13122B
// Morado / lila  : 643CEB
// gris (lyric)   : 302F42