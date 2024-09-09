import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class SurgeryExperience extends StatelessWidget {
  const SurgeryExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "수술 경험이 있으신가요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["예", "아니오"],
            onSelected: (option) {
              // 선택된 옵션 처리
              print("Selected option: $option");
            },
          ),
        ],
      ),
    );
  }
}