import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "성별이 어떻게 되시나요?"),
          const SizedBox(height: 20),
          const Text(
            "외부에 공개되지 않아요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["남성", "여성", "기타"],
            onSelected: (option) {
              // 선택된 옵션 처리
              print("Selected gender: $option");
            },
          ),
        ],
      ),
    );
  }
}