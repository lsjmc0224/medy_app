import 'package:flutter/material.dart';

class IntroNextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;

  const IntroNextButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<IntroNextButton> createState() => _IntroNextButtonState();
}

class _IntroNextButtonState extends State<IntroNextButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3888FF), // 버튼 배경색을 #3888FF로 설정
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white, // 글자색을 하얀색으로 설정
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}