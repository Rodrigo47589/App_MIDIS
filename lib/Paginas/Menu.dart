import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  QuestionScreen({super.key});

  Future<void> playSound() async {
    // Reproduce el audio
    await _audioPlayer.play(AssetSource('audios/canon.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 13, 112),
      appBar: AppBar(
        title: const Text("Pregunta 1"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon:
                    const Icon(Icons.volume_up, size: 50.0, color: Colors.blue),
                onPressed: playSound,
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _emojiButton("😐", "Nada", 0),
                  _emojiButton("😁", "Nunca", 1),
                  _emojiButton("🤨", "Un Poco", 2),
                  _emojiButton("😔", "Poco", 3),
                  _emojiButton("😠", "Frecuente", 4),
                  _emojiButton("😡", "Siempre", 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emojiButton(String emoji, String label, int score) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 30)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.black)), // Texto en negro
      ],
    );
  }
}
