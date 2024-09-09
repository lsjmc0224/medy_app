import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class HemophiliaType extends StatelessWidget {
  const HemophiliaType({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "앓고 있는 인자는\n어떻게 되시나요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["8인자", "9인자", "기타"],
            onSelected: (option) {
              // 선택된 옵션 처리
              print("Selected hemophilia type: $option");
            },
          ),
        ],
      ),
    );
  }
}