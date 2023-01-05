
import 'package:alpha_study_project/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:alpha_study_project/screens/settings.dart';



// мой коммит

// int a = 6;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page1(),
      routes: {
        
        '/Page3': (context) => Page3(),
      },
    );
  }
}



