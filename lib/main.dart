
import 'package:alpha_study_project/generated/codegen_loader.g.dart';
import 'package:alpha_study_project/screens/home.dart';
import 'package:alpha_study_project/service.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:alpha_study_project/screens/settings.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/zikr.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }
  await Hive.initFlutter();

  await Hive.openBox<Zikr>('zikrs');
  runApp(
    EasyLocalization (
      assetLoader:  CodegenLoader(),
     supportedLocales: const [ Locale('en'),  Locale('ru')],
      path: 'assets/translations', 
      fallbackLocale: const Locale('ru',),
    child: 
    const MyApp()));
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      
      // routes: {
        
      //   '/Page3': (context) => Page3(),
      // },
    );
  }
}



