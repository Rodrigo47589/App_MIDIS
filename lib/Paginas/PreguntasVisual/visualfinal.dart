import 'package:flutter/material.dart';
import 'package:flutter_application_1/Paginas/score_manager.dart';

class QuestionScreenfinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scoreManager = ScoreManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados"),
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
              Text(
                "Resultados",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              const SizedBox(height: 20),
              Text("Puntos de preguntas buenas: ${scoreManager.goodPoints}"),
              Text("Puntos de preguntas malas: ${scoreManager.badPoints}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Reinicia los puntajes y regresa al inicio
                  scoreManager.resetScores();
                  Navigator.popUntil(context, ModalRoute.withName('/menu'));
                },
                child: const Text("Volver al inicio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
