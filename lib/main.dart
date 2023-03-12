import 'package:alpha_study_project/generated/codegen_loader.g.dart';
import 'package:alpha_study_project/screens/Auth_/account_screen.dart';
import 'package:alpha_study_project/screens/Auth_/home_screen.dart';
import 'package:alpha_study_project/screens/Auth_/login_screen.dart';
import 'package:alpha_study_project/screens/Auth_/reset_password_screen.dart';
import 'package:alpha_study_project/screens/Auth_/singup_screen.dart';
import 'package:alpha_study_project/screens/Auth_/verify_email_screen.dart';
import 'package:alpha_study_project/screens/home.dart';
import 'package:alpha_study_project/screens/provider.dart';
import 'package:alpha_study_project/service.dart';
import 'package:alpha_study_project/services/firebase_streem.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:alpha_study_project/screens/settings.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  MobileAds.instance.initialize();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }
  await Hive.initFlutter();

  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      startLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FirebaseStream();
      },
      routes: <RouteBase>[
         GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();
          },
        ),
        GoRoute(
          path: 'homeScreen',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'account',
          builder: (BuildContext context, GoRouterState state) {
            return const AccountScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
         GoRoute(
          path: 'reset_password',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordScreen();
          },
        ),
        GoRoute(
          path: 'verify_email',
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyEmailScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderZikr(),
      lazy: false,
      builder: (context, child) {
        final load = context.watch<ProviderZikr>().loadingProvider;

        if (load) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              body: Center(child: Text('Loading')),
            ),
          );
        } else if (!load) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
          );
        } else {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              body: Center(child: Text('Error')),
            ),
          );
        }
      },
    );
  }
}
