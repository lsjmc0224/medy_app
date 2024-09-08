import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String text;

  const QuestionText({
    super.key,
    required this.text,
  });

  @override
  State<QuestionText> createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}