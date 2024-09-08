import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class DiagnosisAge extends StatefulWidget {
  const DiagnosisAge({super.key});

  @override
  _DiagnosisAgeState createState() => _DiagnosisAgeState();
}

class _DiagnosisAgeState extends State<DiagnosisAge> {
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "몇 년도에 혈우병을 진단받았나요?"),
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
          const SizedBox(height: 82),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "진단받은 해",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
  }
}