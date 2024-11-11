import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPage extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPage({super.key});

  Future<void> playSound() async {
    // Ruta del archivo de audio local
    await _audioPlayer.play(AssetSource('audios/canon.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 13, 112),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.volume_up, size: 50.0, color: Colors.white),
          onPressed: () {
            playSound();
          },
        ),
      ),
    );
  }
}
