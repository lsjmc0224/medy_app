import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class TripFrequency extends StatelessWidget {
  const TripFrequency({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "장거리 여행을\n얼마나 자주 다니시나요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["1~2주에 1번", "1~2달에 1번", "6개월에 1번 이하"],
            onSelected: (option) {
              // 선택된 옵션 처리
              print("Selected frequency: $option");
            },
          ),
        ],
      ),
    );
  }
}