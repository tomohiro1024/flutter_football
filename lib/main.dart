import 'package:flutter/material.dart';
import 'package:flutter_footbool/screens/quiz/quiz_screen.dart';

import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(),
    );
  }
}
