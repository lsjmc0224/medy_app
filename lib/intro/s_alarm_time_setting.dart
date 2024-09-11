import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class AlarmTimeSetting extends StatefulWidget {
  const AlarmTimeSetting({super.key});

  @override
  State<AlarmTimeSetting> createState() => _AlarmTimeSettingState();
}

class _AlarmTimeSettingState extends State<AlarmTimeSetting> {
  TimeOfDay initialTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "유지요법을 하실 날짜에\n알림 받을 시간을 정해주세요"),
          const SizedBox(height: 20),
          const Text(
            "언제든지 수정할 수 있어요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(height: 20),
          // TODO: 시간 선택 위젯 넣기
          CustomTimePickerButton(
            initialTime: TimeOfDay.now(),
            onTimeSelected: (TimeOfDay newTime) {
              print('Selected time: ${newTime.format(context)}');
            },
          )
        ],
      ),
    );
  }
}

class CustomTimePickerButton extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeSelected;

  const CustomTimePickerButton({
    Key? key,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _CustomTimePickerButtonState createState() => _CustomTimePickerButtonState();
}

class _CustomTimePickerButtonState extends State<CustomTimePickerButton> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final TimeOfDay? timeOfDay = await showTimePicker(
          context: context,
          initialTime: _selectedTime,
        );
        if (timeOfDay != null) {
          setState(() {
            _selectedTime = timeOfDay;
          });
          widget.onTimeSelected(_selectedTime);
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffcccccc)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _formatTime(_selectedTime),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Noto Sans KR',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod.toString();
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? '오전' : '오후';
    return '$period $hour:$minute';
  }
}