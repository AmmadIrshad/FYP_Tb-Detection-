import 'package:flutter/material.dart';
import 'package:tb_detection/data/questionnaire_provider.dart';
import 'package:tb_detection/screens/tb_questionnaire_screen.dart';
import 'package:tb_detection/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionnaireProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TB Risk Assessment',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      routes: {
        '/home': (context) =>
            TBQuestionnaireScreen(), // Define your home screen route
      },
    );
  }
}
