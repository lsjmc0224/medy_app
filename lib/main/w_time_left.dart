import 'package:flutter/material.dart';

class TimeLeft extends StatefulWidget {
  const TimeLeft({super.key});

  @override
  State<TimeLeft> createState() => _TimeLeftState();
}

class _TimeLeftState extends State<TimeLeft> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25), // 그림자 색상 (투명도 포함)
            spreadRadius: 3, // 그림자의 크기 확산
            blurRadius: 5, // 그림자 흐림 정도
            offset: Offset(0, 0), // 그림자 위치 (x, y)
          ),
        ],
      ),
      child: Column(
        children: [
          Text("마지막 투여로부터..."),
          Text("1일 20시간 지났습니다"),
        ],
      ),
    );
  }
}
