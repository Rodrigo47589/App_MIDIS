class ScoreManager {
  int goodPoints = 0; // Puntos de las buenas preguntas
  int badPoints = 0; // Puntos de las malas preguntas

  // Singleton para mantener el estado compartido
  static final ScoreManager _instance = ScoreManager._internal();
  factory ScoreManager() => _instance;
  ScoreManager._internal();

  void resetScores() {
    goodPoints = 0;
    badPoints = 0;
  }
}
