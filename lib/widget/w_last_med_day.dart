import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastMedDay extends StatefulWidget {
  final String medName;
  final DateTime? medDay;
  final VoidCallback? onTap;

  const LastMedDay({
    super.key,
    required this.medName,
    this.medDay,
    this.onTap,
  });

  @override
  _LastMedDayState createState() => _LastMedDayState();
}

class _LastMedDayState extends State<LastMedDay> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _checkIfTodayIsLastMedDay();
  }

  void _checkIfTodayIsLastMedDay() {
    if (widget.medDay != null && _isToday(widget.medDay!)) {
      setState(() {
        _isSelected = true;
      });
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap?.call();
      },
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: _isSelected ? const Color(0xff3888ff) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.medName,
                    style: TextStyle(
                      fontSize: 24,
                      color: _isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "마지막 투여일: ${_formatLastMedDay()}",
                    style: TextStyle(
                      fontSize: 12,
                      color: _isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.check_circle,
                color: _isSelected ? Colors.white : const Color(0xff3888ff),
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatLastMedDay() {
    if (widget.medDay == null) {
      return "없음";
    } else {
      return DateFormat('yy.MM.dd').format(widget.medDay!);
    }
  }
}