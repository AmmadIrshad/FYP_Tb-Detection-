// import 'package:flutter/material.dart';
// import 'package:tb_detection/data/questionnaire_provider.dart';
// import 'package:tb_detection/screens/tb_questionnaire_screen.dart';
// import 'package:tb_detection/screens/splash_screen.dart';
// import 'package:provider/provider.dart';

// void main() {
//   //runApp(const MyApp());
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => QuestionnaireProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TB Risk Assessment',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const SplashScreen(),
//       routes: {
//         '/home': (context) =>
//             TBQuestionnaireScreen(), // Define your home screen route
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tb_detection/data/questionnaire_provider.dart';
import 'package:tb_detection/screens/tb_questionnaire_screen.dart';
import 'package:tb_detection/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black87),
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Color(0xFF121212), // Dark background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.shade900,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system, // Uses system theme mode (light or dark)
      home: const SplashScreen(),
      routes: {
        '/home': (context) => TBQuestionnaireScreen(),
      },
    );
  }
}
