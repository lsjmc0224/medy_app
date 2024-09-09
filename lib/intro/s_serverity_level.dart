import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class SeverityLevel extends StatelessWidget {
  const SeverityLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "중증도가 어떻게 되시나요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["중증", "중등도", "경증"],
            onSelected: (option) {
              print("Selected severity: $option");
            },
          ),
        ],
      ),
    );
  }
}