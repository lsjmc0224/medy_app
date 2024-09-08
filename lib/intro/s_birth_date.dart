import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

class BirthDate extends StatefulWidget {
  const BirthDate({super.key});

  @override
  _BirthDateState createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const QuestionText(text: "생년월일이 어떻게 되시나요?"),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: yearController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "연",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: monthController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "월",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: dayController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "일",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
