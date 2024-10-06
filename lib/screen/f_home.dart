import 'package:flutter/material.dart';
import '../widget/w_appbar.dart';
import '../widget/w_calendar.dart';
import '../widget/w_last_med_day.dart';
import '../widget/w_time_spent.dart';
import '../widget/w_traffic_light.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late DateTime lastMedTime;
  late List<DateTime> allMedDates;
  bool isLastMedDayActivated = false; // LastMedDay 활성화 여부

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      allMedDates = List.generate(10, (index) => DateTime.now().subtract(Duration(days: (index + 1) * 2)));
      lastMedTime = allMedDates.first; // allMedDates의 마지막 요소를 lastMedTime으로 설정
    });
  }

  void _toggleLastMedDay() {
    setState(() {
      if (isLastMedDayActivated) {
        // LastMedDay가 비활성화된 상태에서 눌렀을 때
        lastMedTime = DateTime.now().subtract(Duration(days: 2)); // lastMedTime을 0으로 초기화
        if (allMedDates.isNotEmpty) {
          allMedDates.removeLast(); // allMedDates의 마지막 요소 삭제
        }
      } else {
        // LastMedDay가 활성화된 상태에서 눌렀을 때
        lastMedTime = DateTime.now(); // lastMedTime을 현재 시간으로 설정
        allMedDates.add(lastMedTime); // allMedDates에 현재 시간 추가
      }
      isLastMedDayActivated = !isLastMedDayActivated; // 활성화 상태 토글
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
                      medName: "애드베이트",
                      medDay: lastMedTime,
                      onTap: _toggleLastMedDay, // 탭 이벤트 처리 메서드 호출
                    ),
                    const SizedBox(height: 16),
                    MainCalendar(markedDates: allMedDates), // 달력 위젯
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
