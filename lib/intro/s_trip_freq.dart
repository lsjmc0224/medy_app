import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class TripFrequency extends StatefulWidget {
  const TripFrequency({super.key});

  @override
  State<TripFrequency> createState() => _TripFrequencyState();
}

class _TripFrequencyState extends State<TripFrequency> {
  String? selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "장거리 여행을\n얼마나 자주 다니시나요?"),
          const Expanded(
            child: SizedBox(),
          ),
          _buildFrequencyOption("1~2주에 1번"),
          const SizedBox(height: 10),
          _buildFrequencyOption("1~2달에 1번"),
          const SizedBox(height: 10),
          _buildFrequencyOption("6개월에 1번 이하"),
        ],
      ),
    );
  }

  Widget _buildFrequencyOption(String frequency) {
    bool isSelected = selectedFrequency == frequency;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFrequency = frequency;
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
              value: frequency,
              groupValue: selectedFrequency,
              onChanged: (String? value) {
                setState(() {
                  selectedFrequency = value;
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
              frequency,
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
