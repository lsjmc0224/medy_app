import 'package:flutter/material.dart';

class TrafficLight extends StatelessWidget {
  final DateTime timeLeft;

  TrafficLight({required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12), // 12픽셀의 패딩
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLight(_getLightColor(timeLeft), Colors.green),
          _buildLight(_getLightColor(timeLeft), Colors.yellow),
          _buildLight(_getLightColor(timeLeft), Colors.red),
        ],
      ),
    );
  }

  // 신호등 각 불을 나타내는 Circle 위젯을 구성
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

  // 남은 시간에 따라 신호등의 색상 결정
  Color _getLightColor(DateTime timeLeft) {
    final now = DateTime.now();
    final difference = timeLeft.difference(now).inHours;

    if (difference >= 24) {
      return Colors.green; // 24시간 이상 남았을 때 초록색
    } else if (difference >= 0) {
      return Colors.yellow; // 24시간 미만 0시간 이상 남았을 때 노란색
    } else {
      return Colors.red; // 0시간 미만일 때 빨간색
    }
  }
}