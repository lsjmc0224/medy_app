import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class SurveyChoice extends StatefulWidget {
  const SurveyChoice({super.key});

  @override
  State<SurveyChoice> createState() => _SurveyChoiceState();
}

class _SurveyChoiceState extends State<SurveyChoice> {
  final List<String> options = [
    '헤모라이프',
    '인터넷 커뮤니티',
    '코헴',
    '혈우재단',
    '앱스토어 / 구글플레이',
    '네이버 검색',
    '블로그',
    '기타'
  ];

  final Set<String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) => _buildOptionItem(option)).toList(),
    );
  }

  Widget _buildOptionItem(String option) {
    final isSelected = selectedOptions.contains(option);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedOptions.remove(option);
          } else {
            selectedOptions.add(option);
          }
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF3888FF) : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? const Color(0xFF3888FF) : const Color(0xFFCCCCCC),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}

class UserFunnel extends StatelessWidget {
  const UserFunnel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          QuestionText(text: "Medy를 어떻게 알게 되셨나요?"),
          SizedBox(height: 16),
          Text(
            "중복선택이 가능해요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          SizedBox(height: 20),
          SurveyChoice(),
        ],
      ),
    );
  }
}