import 'package:flutter/material.dart';
import 'package:medy/intro/intro_page.dart';
import 'package:medy/main/s_main_page.dart';

class MedyApp extends StatelessWidget {
  const MedyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Color(0xff3888ff),
            secondary: Colors.white,
            tertiary: Colors.grey),
      ),
      title: 'Medy',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => IntroPage(),
        '/mainScreen': (_) => MainPage(),
      },
      // home: const MainPage(),
    );
  }
}