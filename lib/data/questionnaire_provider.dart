// class TBQuestionnaire {
//   final Map<String, int> questions = {
//     "Persistent cough for over 2 weeks?": 5,
//     "Coughing blood?": 10,
//     "Chest pain?": 4,
//     "Unexplained weight loss?": 3,
//     "Regular night sweats?": 3,
//     "Fatigue?": 2,
//     "Contact with TB patient?": 4,
//     "Travel to TB-endemic area?": 2,
//     "Compromised immune system?": 3,
//   };

//   var responses = {};

//   int calculateRiskScore() {
//     int score = 0;
//     questions.forEach((question, weight) {
//       if (responses[question] == true) {
//         score += weight;
//       }
//     });
//     return score;
//   }

//   TBQuestionnaire() {
//     resetResponses(); // Ensure responses map is initialized
//   }

//   // void resetResponses() {
//   //   responses = {};
//   //   //responses.clear();
//   //   //responses = {for (var question in questions.keys) question: false};
//   // }
//   void resetResponses() {
//     responses.clear();
//     responses = {
//       for (var question in questions.keys) question: null
//     }; // Set each question's response to null or false
//   }

//   String getRecommendation() {
//     int score = calculateRiskScore();
//     if (score >= 15) {
//       return "High risk of TB. Immediate chest X-ray recommended.";
//     } else if (score >= 8) {
//       return "Moderate risk of TB. Consider chest X-ray if symptoms persist.";
//     } else {
//       return "Low risk of TB. Monitor symptoms.";
//     }
//   }
// }
import 'package:flutter/material.dart';

class QuestionnaireProvider with ChangeNotifier {
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

  // Use Map to store responses
  Map<String, bool?> responses = {};

  QuestionnaireProvider() {
    resetResponses(); // Initialize responses on startup
  }

  // Method to reset responses
  void resetResponses() {
    responses = {for (var question in questions.keys) question: null};
    notifyListeners(); // Notify listeners that state has changed
  }

  // Update a response and notify listeners
  void updateResponse(String question, bool response) {
    responses[question] = response;
    notifyListeners();
  }

  // Check if all questions are answered
  bool get allQuestionsAnswered =>
      responses.values.every((response) => response != null);

  // Calculate the risk score
  int calculateRiskScore() {
    int score = 0;
    questions.forEach((question, weight) {
      if (responses[question] == true) {
        score += weight;
      }
    });
    return score;
  }

  // Get the recommendation based on score
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
