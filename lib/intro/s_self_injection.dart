import 'package:flutter/material.dart';
import 'package:medy/intro/w_option_selector.dart';
import 'package:medy/intro/w_question_text.dart';

class SelfInjection extends StatelessWidget {
  const SelfInjection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "자가주사가 가능하신가요?"),
          const Expanded(child: SizedBox()),
          OptionSelector(
            options: const ["예", "아니오"],
            onSelected: (option) {
              print("Selected self-injection capability: $option");
            },
          ),
        ],
      ),
    );
  }
}