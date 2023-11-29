import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const AudioApp());
}

class AudioApp extends StatelessWidget {
  const AudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> words = [
    'buna',
    'hello',
    'cum esti',
    'how are you',
    'sunt bine',
    'I\'m fine',
    'Eu sunt Tudor',
    'I am Tudor'
  ];
  final AudioPlayer audioPlayer = AudioPlayer();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: words.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    playAudio(index);
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.blue, Colors.purple],
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(child: Text(words[index])),
                    ),
                  ));
            }),
      ),
    );
  }

  final player = AudioCache(prefix: 'assets/');
  final List<String> audioList = [
    'Buna.mp3',
    'hello.mp3',
    'Cum_esti.mp3',
    'how_are_you.mp3',
    'Sunt_bine.mp3',
    'I_am_fine.mp3',
    'Eu_sunt_Tudor.mp3',
    'I_am_Tudor.mp3'
  ];

  void playAudio(int i) async {
    audioPlayer.audioCache = player;
    await audioPlayer.play(AssetSource(audioList[i]));
  }
}
