import 'package:flutter/material.dart';
import 'package:tb_detection/data/tb_questionnaire.dart';
import 'package:tb_detection/screens/results.dart';
import 'package:tb_detection/widgets/assessment_submit_button.dart';

class TBQuestionnaireScreen extends StatefulWidget {
  const TBQuestionnaireScreen({super.key});

  @override
  State<TBQuestionnaireScreen> createState() => _TBQuestionnaireScreenState();
}

class _TBQuestionnaireScreenState extends State<TBQuestionnaireScreen> {
  TBQuestionnaire tbQuestionnaire = TBQuestionnaire();

  // Track if user has submitted
  bool hasSubmitted = false;
  String recommendation = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05; // Responsive padding

    return Scaffold(
      appBar: AppBar(
        title: Text('TB Risk Assessment'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: tbQuestionnaire.questions.keys.map((question) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale: 1.05,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          child: ListTile(
                            title: Text(
                              question,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tbQuestionnaire.responses[question] =
                                          true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        tbQuestionnaire.responses[question] ==
                                                true
                                            ? Color.fromARGB(255, 63, 56, 73)
                                            : Colors.grey[300],
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text("Yes"),
                                ),
                                SizedBox(width: 4),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      tbQuestionnaire.responses[question] =
                                          false;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: tbQuestionnaire
                                                .responses[question] ==
                                            false
                                        ? const Color.fromARGB(255, 63, 56, 73)
                                        : Colors.grey[300],
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text("No"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            AssessmentSubmitButton(
              tbQuestionnaire: tbQuestionnaire,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
