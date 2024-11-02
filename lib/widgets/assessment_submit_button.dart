import 'package:flutter/material.dart';
import 'package:tb_detection/data/tb_questionnaire.dart';

import 'package:tb_detection/screens/results.dart';

class AssessmentSubmitButton extends StatefulWidget {
  final TBQuestionnaire tbQuestionnaire;
  const AssessmentSubmitButton({super.key, required this.tbQuestionnaire});

  @override
  State<AssessmentSubmitButton> createState() => _AssessmentSubmitButtonState();
}

class _AssessmentSubmitButtonState extends State<AssessmentSubmitButton> {
  bool hasSubmitted = false;
  String recommendation = "";

  bool allQuestionsAnswered() {
    for (var question in widget.tbQuestionnaire!.questions.keys) {
      if (widget.tbQuestionnaire.responses[question] == null) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (allQuestionsAnswered()) {
          setState(() {
            hasSubmitted = true;
            recommendation = widget.tbQuestionnaire.getRecommendation();
            // Navigate to the result screen with the recommendation
            if (hasSubmitted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultScreen(recommendation: recommendation),
                ),
              ).then((_) {
                // Reset responses after returning to this screen
                setState(() {
                  widget.tbQuestionnaire.resetResponses();
                  hasSubmitted =
                      false; // Optionally, reset the submission state
                });
              });
            }
          });
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Incomplete Form"),
              content: Text("Please answer all questions before submitting."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
