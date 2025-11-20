
import 'package:appdioteste/classes/dark_mode.dart';
import 'package:appdioteste/pages/main_page.dart';
import 'package:appdioteste/pages/splash_screen_page.dart';
import 'package:appdioteste/service/contador_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkMode>(
          create: (_) => DarkMode()),
          ChangeNotifierProvider<ContadorService>(create: (_) => ContadorService())
      ],
      child: Consumer<DarkMode>(
        builder: (_, darkmode, widget) {
          return MaterialApp(
            home: const SplashScreenPage(),
            theme: darkmode.darkMode ? ThemeData.dark(
              useMaterial3: true,
            ) : ThemeData.light(
              useMaterial3: true,
            ),
          );
        }
      ),
    );
  }
}