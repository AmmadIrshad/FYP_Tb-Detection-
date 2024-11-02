class TBQuestionnaire {
  final Map<String, int> questions = {
    "Persistent cough for over 2 weeks?": 5,
    "Coughing blood?": 10,
    "Chest pain?": 4,
    "Unexplained weight loss?": 3,
    "Regular night sweats?": 3,
    "Fatigue?": 2,
    "Contact with TB patient?": 4,
    "Travel to TB-endemic area?": 2,
    "Compromised immune system?": 3,
  };

  Map<String, bool> responses = {};

  int calculateRiskScore() {
    int score = 0;
    questions.forEach((question, weight) {
      if (responses[question] == true) {
        score += weight;
      }
    });
    return score;
  }

  String getRecommendation() {
    int score = calculateRiskScore();
    if (score >= 15) {
      return "High risk of TB. Immediate chest X-ray recommended.";
    } else if (score >= 8) {
      return "Moderate risk of TB. Consider chest X-ray if symptoms persist.";
    } else {
      return "Low risk of TB. Monitor symptoms.";
    }
  }
}
