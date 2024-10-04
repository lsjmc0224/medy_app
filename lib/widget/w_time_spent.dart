import 'package:flutter/material.dart';
import 'dart:async';

class TimeSpent extends StatefulWidget {
  final DateTime lastMedTime;

  const TimeSpent({super.key, required this.lastMedTime});

  @override
  State<TimeSpent> createState() => _TimeSpentState();
}

class _TimeSpentState extends State<TimeSpent> {
  late Timer _timer;
  late String _timeSpentText;

  @override
  void initState() {
    super.initState();
    _updateTimeSpent();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateTimeSpent();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimeSpent() {
    Duration difference = DateTime.now().difference(widget.lastMedTime);
    setState(() {
      if (difference.inHours >= 24) {
        int days = difference.inDays;
        int hours = difference.inHours % 24;
        _timeSpentText = '$days일 $hours시간 지났습니다';
      } else {
        int hours = difference.inHours;
        int minutes = difference.inMinutes % 60;
        _timeSpentText = '$hours시간 $minutes분 지났습니다';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "마지막 투여로부터...",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffcccccc),
              ),
            ),
            Text(
              _timeSpentText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}