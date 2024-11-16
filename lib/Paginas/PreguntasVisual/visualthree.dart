import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/Paginas/PreguntasVisual/visualfour.dart';

class QuestionScreenthree extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  QuestionScreenthree({super.key});

  Future<void> playSound() async {
    // Reproduce el audio
    await _audioPlayer.play(AssetSource('audios/canon.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 13, 112),
      appBar: AppBar(
        title: const Text("Pregunta 3"),
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
                  _emojiButton(context, "😁", "1.Nunca"),
                  _emojiButton(context, "🤨", "2.Un Poco"),
                  _emojiButton(context, "😔", "3.Poco"),
                  _emojiButton(context, "😠", "4.Frecuente"),
                  _emojiButton(context, "😡", "5.Siempre"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emojiButton(BuildContext context, String emoji, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreenfour(),
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
