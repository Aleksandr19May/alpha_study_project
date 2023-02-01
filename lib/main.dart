import 'package:alpha_study_project/generated/codegen_loader.g.dart';
import 'package:alpha_study_project/screens/home.dart';
import 'package:alpha_study_project/service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:alpha_study_project/screens/settings.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/zikr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }
  await Hive.initFlutter();

  await Hive.openBox<Zikr>('zikrs');
  runApp(EasyLocalization(
      assetLoader: CodegenLoader(),
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale(
        'ru',
      ),
      child: const MyApp()));
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
            return const Settings();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {return ChangeNotifierProvider(create: (context) => ProviderZikr(),
  
  
    child: MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,

      // routes: {

      //   '/Page3': (context) => Page3(),
      // },
    ));
  }
}

class ProviderZikr extends ChangeNotifier {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool activity = true;
  bool color = true;
  int counter = 0;
  String titleZikr = '5';
  final String keyCounter = 'counter';
  ProviderZikr() {
    instanceDb();
  }

  Future<void> instanceDb() async {
    final SharedPreferences _prefs = await prefs;

    if (_prefs.getInt(keyCounter) == null) {
      _prefs.setInt(keyCounter, 0);
    } else {
      counter = _prefs.getInt(keyCounter)!;
    }
    notifyListeners();
  }

  late Box<Zikr> savesZikrs;
 

  Future<void> saveCount() async {
    notifyListeners();

    final SharedPreferences _prefs = await prefs;
    _prefs.setInt(keyCounter, counter);
  }

  void increment() {
    counter++;
    saveCount();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      saveCount();
    }
  }

  void zeroing() {
    if (counter > 0) {
      counter = 0;
      saveCount();
    }
  }
}
