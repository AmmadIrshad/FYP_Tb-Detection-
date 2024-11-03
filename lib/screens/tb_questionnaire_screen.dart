import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tb_detection/data/questionnaire_provider.dart';
import 'package:tb_detection/screens/results.dart';

class TBQuestionnaireScreen extends StatelessWidget {
  const TBQuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionnaireProvider = Provider.of<QuestionnaireProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('TB Risk Assessment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: questionnaireProvider.questions.keys.map((question) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(question),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              questionnaireProvider.updateResponse(
                                  question, true);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  questionnaireProvider.responses[question] ==
                                          true
                                      ? Colors.green
                                      : Colors.grey[300],
                            ),
                            child: Text("Yes"),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              questionnaireProvider.updateResponse(
                                  question, false);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  questionnaireProvider.responses[question] ==
                                          false
                                      ? Colors.red
                                      : Colors.grey[300],
                            ),
                            child: Text("No"),
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
                if (questionnaireProvider.allQuestionsAnswered) {
                  String recommendation =
                      questionnaireProvider.getRecommendation();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(recommendation: recommendation),
                    ),
                  ).then((_) {
                    questionnaireProvider
                        .resetResponses(); // Clear responses when returning
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Incomplete Form"),
                      content: Text(
                          "Please answer all questions before submitting."),
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
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
