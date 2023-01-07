
import 'package:alpha_study_project/screens/home.dart';
import 'package:alpha_study_project/service.dart';
import 'package:flutter/material.dart';

import 'package:alpha_study_project/screens/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/zikr.dart';



// мой коммит

// int a = 6;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }
  await Hive.initFlutter();

  await Hive.openBox<Zikr>('zikrs');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        
        '/Page3': (context) => Page3(),
      },
    );
  }
}



