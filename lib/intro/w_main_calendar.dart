import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final Set<DateTime> selectedDates;

  const MainCalendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDates,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: (day) => selectedDates.contains(day),
      focusedDay: now,
      firstDay: firstDayOfMonth,
      lastDay: lastDayOfMonth,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Color(0xFFCCCCCC),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        outsideDaysVisible: false,
        disabledTextStyle: TextStyle(color: Colors.grey),
      ),
      enabledDayPredicate: (day) => day.month == now.month && day.isAfter(now.subtract(const Duration(days: 1))),
    );
  }
}