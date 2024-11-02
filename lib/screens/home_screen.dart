import 'package:flutter/material.dart';
import 'package:tb_detection/data/tb_questionnaire.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('TB Risk Assessment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: tbQuestionnaire.questions.keys.map((question) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(question),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                tbQuestionnaire.responses[question] = true;
                              });
                            },
                            child: Text("Yes"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  tbQuestionnaire.responses[question] == true
                                      ? Colors.green
                                      : null,
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                tbQuestionnaire.responses[question] = false;
                              });
                            },
                            child: Text("No"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  tbQuestionnaire.responses[question] == false
                                      ? Colors.red
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  hasSubmitted = true;
                  recommendation = tbQuestionnaire.getRecommendation();
                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            if (hasSubmitted) ...[
              Text(
                'Recommendation:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                recommendation,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
