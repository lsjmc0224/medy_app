import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class SurgeryExperience extends StatefulWidget {
  const SurgeryExperience({super.key});

  @override
  State<SurgeryExperience> createState() => _SurgeryExperienceState();
}

class _SurgeryExperienceState extends State<SurgeryExperience> {
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "수술 경험이 있으신가요?"),
          const Expanded(
            child: SizedBox(),
          ),
          _buildAnswerOption("예"),
          const SizedBox(height: 10),
          _buildAnswerOption("아니오"),
        ],
      ),
    );
  }

  Widget _buildAnswerOption(String answer) {
    bool isSelected = selectedAnswer == answer;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = answer;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3888FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF3888FF) : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: answer,
              groupValue: selectedAnswer,
              onChanged: (String? value) {
                setState(() {
                  selectedAnswer = value;
                });
              },
              activeColor: Colors.white,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.white;
                }
                return const Color(0xFF3888FF);
              }),
            ),
            const SizedBox(width: 8),
            Text(
              answer,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}