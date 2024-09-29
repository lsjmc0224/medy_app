import 'package:flutter/material.dart';
import 'package:medy/intro/w_intro_calendar.dart';
import 'package:medy/intro/w_question_text.dart';

class PreventiveUseDays extends StatefulWidget {
  const PreventiveUseDays({super.key});

  @override
  State<PreventiveUseDays> createState() => _PreventiveUseDaysState();
}

class _PreventiveUseDaysState extends State<PreventiveUseDays> {
  Set<DateTime> selectedDates = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "이번달 월간 유지요법일을\n정해주세요"),
          const SizedBox(height: 16),
          const Text(
            "언제든지 수정할 수 있어요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          Expanded(
            child: Center(
              child: IntroCalendar(
                selectedDates: selectedDates,
                onDaySelected: (selectedDay, focusedDay) {
                  updateSelectedDates(selectedDates, selectedDay, (newDates) {
                    setState(() {
                      selectedDates = newDates;
                    });
                  });
                },
              ),
            ),
          ),
          Text("이번 달 오늘 이후 총 ${selectedDates.where((date) => date.isAfter(DateTime.now())).length}번 투여 예정")
        ],
      ),
    );
  }

  void updateSelectedDates(Set<DateTime> selectedDates, DateTime selectedDay, Function(Set<DateTime>) setStateCallback) {
    final newSelectedDates = Set<DateTime>.from(selectedDates);
    if (newSelectedDates.contains(selectedDay)) {
      newSelectedDates.remove(selectedDay);
    } else {
      newSelectedDates.add(selectedDay);
    }
    setStateCallback(newSelectedDates);
  }
}