import 'package:flutter/material.dart';
import 'package:medy/intro/question_text.dart';

class IntroStart extends StatelessWidget {
  const IntroStart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 진도 표시 바
        SizedBox(height: 16),
        // 내용 부분
        QuestionText(text: "안녕하세요! 만나서 반가워요.\n더 나은 서비스를\n제공해 드리기 위해\n몇 가지 질문을 드릴게요."),
      ],
    );
  }
}