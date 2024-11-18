import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/Paginas/PreguntasVisual/visualeight.dart';
import 'package:flutter_application_1/Paginas/score_manager.dart';

class QuestionScreenseven extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  QuestionScreenseven({super.key});

  Future<void> playSound() async {
    // Reproduce el audio
    await _audioPlayer.play(AssetSource('audios/canon.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 13, 112),
      appBar: AppBar(
        title: const Text("Pregunta 7"),
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
                  _emojiButton(context, "😁", "1.Nunca", 1),
                  _emojiButton(context, "🤨", "2.Un Poco", 2),
                  _emojiButton(context, "😔", "3.Poco", 3),
                  _emojiButton(context, "😠", "4.Frecuente", 4),
                  _emojiButton(context, "😡", "5.Siempre", 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emojiButton(
      BuildContext context, String emoji, String label, int puntos) {
    return GestureDetector(
      onTap: () {
        ScoreManager().badPoints += puntos;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreeneight(),
          ),
        );
      },
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(color: Colors.black)), // Texto en negro
        ],
      ),
    );
  }
}
