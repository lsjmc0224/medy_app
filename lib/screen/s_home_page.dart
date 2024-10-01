import 'package:flutter/material.dart';
import '../widget/w_appbar.dart';
import '../widget/w_calendar.dart';
import '../widget/w_last_med_day.dart';
import '../widget/w_time_spent.dart';
import '../widget/w_traffic_light.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime lastMedTime;
  late List<DateTime> allMedDates;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Future.delayed(const Duration(seconds: 1)); // API 호출 시뮬레이션
    setState(() {
      lastMedTime = DateTime.now().subtract(const Duration(hours: 3, minutes: 30));
      allMedDates = List.generate(10, (index) => DateTime.now().subtract(Duration(days: index * 2)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff3888ff), // 페이지 배경색
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MedyAppBar(), // 앱바 위젯
            Container(
              height: 800,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)), // 둥근 상단 모서리
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TrafficLight(lastMedTime: lastMedTime), // 신호등 위젯
                    const SizedBox(height: 16),
                    TimeSpent(lastMedTime: lastMedTime), // 경과시간 위젯
                    const SizedBox(height: 16),
                    LastMedDay(
                      medName: "약 이름",
                      medDay: lastMedTime,
                      onTap: () {
                        // 탭 이벤트 처리
                      },
                    ),
                    const SizedBox(height: 16),
                    MainCalendar(markedDates: allMedDates) // 달력 위젯
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
