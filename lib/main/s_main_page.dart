import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medy/main.dart';
import 'package:medy/main/w_appbar.dart';
import 'package:medy/main/w_time_left.dart';
import 'package:medy/main/w_traffic_light.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3888ff),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MedyAppBar(),
            Container(
              height: 800,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))
              ),
              child: Column(
                children: [
                  // 신호등 위젯
                  TrafficLight(
                    timeLeft: DateTime.now().add(Duration(hours: -1)),
                  ),
                  // 다음약 투여까지 n시간 m분 남았습니다 위젯
                  TimeLeft(),

                  // 약 이름, 마지막 투여일 위젯
                  // 달력 위젯
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
