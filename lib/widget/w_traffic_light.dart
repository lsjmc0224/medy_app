import 'package:flutter/material.dart';

class TrafficLight extends StatelessWidget {
  final DateTime lastMedTime;

  TrafficLight({required this.lastMedTime});

  @override
  Widget build(BuildContext context) {
    final Duration timeSpent = DateTime.now().difference(lastMedTime);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLight(_getLightColor(timeSpent), Colors.green),
          _buildLight(_getLightColor(timeSpent), Colors.yellow),
          _buildLight(_getLightColor(timeSpent), Colors.red),
        ],
      ),
    );
  }

  Widget _buildLight(Color lightColor, Color thisColor) {
    return Container(
      margin: EdgeInsets.all(6.0),
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lightColor == thisColor ? thisColor : Colors.grey,
      ),
    );
  }

  Color _getLightColor(Duration timeSpent) {
    final hours = timeSpent.inHours;

    if (hours <= 24) {
      return Colors.green; // 24시간 이하일 때 초록색
    } else if (hours <= 42) {
      return Colors.yellow; // 24~42시간 이하일 때 노란색
    } else {
      return Colors.red; // 42시간 초과일 때 빨간색
    }
  }
}