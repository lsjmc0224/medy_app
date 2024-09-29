import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medy/main/w_appbar.dart';
import 'package:medy/main/w_calendar.dart';
import 'package:medy/main/w_last_med_day.dart';
import 'package:medy/main/w_time_spent.dart';
import 'package:medy/main/w_traffic_light.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late DateTime lastMedTime;
  late List<DateTime> allMedDates;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // 더미 데이터 생성 및 API 호출을 시뮬레이션하는 메서드
  Future<void> _fetchData() async {
    // TODO: 실제 API 호출로 대체
    await Future.delayed(Duration(seconds: 1)); // API 호출 시뮬레이션

    setState(() {
      // 1. 마지막 약 투여 시간 (더미 데이터)
      lastMedTime = DateTime.now().subtract(Duration(hours: 3, minutes: 30));

      // 2. 모든 약 투여 날짜 리스트 (더미 데이터)
      allMedDates = List.generate(10, (index) =>
          DateTime.now().subtract(Duration(days: index * 2))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // 신호등 위젯
                      TrafficLight(
                        lastMedTime: lastMedTime,
                      ),
                      const SizedBox(height: 16),

                      // 마지막 투여로부터 n시간 m분 지났습니다 위젯
                      TimeSpent(
                        lastMedTime: lastMedTime,
                      ),
                      const SizedBox(height: 16),

                      // 약 이름, 마지막 투여일 위젯
                      LastMedDay(
                        medName: "약 이름",
                        medDay: lastMedTime,
                        onTap: () {
                          // 탭 이벤트 처리
                        },
                      ),
                      const SizedBox(height: 16),

                      // 달력 위젯
                      MainCalendar(
                        markedDates: allMedDates,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}