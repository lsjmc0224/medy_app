import 'package:flutter/material.dart';
import 'package:medy/intro/intro_page.dart';
import 'package:medy/main/s_main_page.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

void main() {
  runApp(const MedyApp());
}

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
      home: const MainPage(),
    );
  }
}

class MedyIntro extends StatefulWidget {
  const MedyIntro({super.key});

  @override
  State<MedyIntro> createState() => _MedyIntroState();
}

class _MedyIntroState extends State<MedyIntro> {
  @override
  Widget build(BuildContext context) {
    return const IntroPage();
  }
}


