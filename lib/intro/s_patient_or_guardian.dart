import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class PatientOrGuardian extends StatelessWidget {
  const PatientOrGuardian({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "환우 본인이신가요?\n아니면 보호자이신가요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["본인", "보호자", "기타"],
            onSelected: (option) {
              print("Selected role: $option");
            },
          ),
        ],
      ),
    );
  }
}