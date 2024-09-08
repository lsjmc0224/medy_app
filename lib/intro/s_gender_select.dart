import 'package:flutter/material.dart';
import 'package:medy/intro/w_intro_next_button.dart';
import 'package:medy/intro/w_question_text.dart';
import 'package:medy/intro/s_residence_area.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 진도 표시 바
          const SizedBox(height: 16),
          const QuestionText(text: "성별이 어떻게 되시나요?"),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "외부에 공개되지 않아요",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff888888),
              ),
            ),
          ),
          const SizedBox(height: 40),
          _buildGenderOption("남성"),
          const SizedBox(height: 10),
          _buildGenderOption("여성"),
          const SizedBox(height: 10),
          _buildGenderOption("기타"),
        ],
      );
  }

  Widget _buildGenderOption(String gender) {
    bool isSelected = selectedGender == gender;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
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
                value: gender,
                groupValue: selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
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
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
