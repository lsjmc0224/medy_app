import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class AlarmTimeSetting extends StatelessWidget {
  const AlarmTimeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "유지요법을 하실 날짜에\n알림 받을 시간을 정해주세요"),
          const SizedBox(height: 20),
          const Text(
            "언제든지 수정할 수 있어요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          // TODO: 시간 선택 위젯 넣기
          Expanded(
            child: Center(
              child: Container(
                color: Colors.yellow,
                child: const Text("TODO: 시간 선택 위젯 넣기"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
