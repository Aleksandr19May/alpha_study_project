
import 'package:alpha_study_project/screens/home.dart';
import 'package:alpha_study_project/service.dart';
import 'package:flutter/material.dart';
import 'package:alpha_study_project/screens/settings.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/zikr.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }
  await Hive.initFlutter();

  await Hive.openBox<Zikr>('zikrs');
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();},
        ),
      ],
    ),
  ],
);







class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router (
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      
      // routes: {
        
      //   '/Page3': (context) => Page3(),
      // },
    );
  }
}



