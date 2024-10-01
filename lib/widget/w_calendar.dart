import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final List<DateTime> markedDates;
  final DateTime today = DateTime.now();

  MainCalendar({super.key, required this.markedDates});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
        padding: const EdgeInsets.all(8),
        child: TableCalendar(
          locale: 'ko_KR',
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2000, 01, 01),
          lastDay: DateTime.utc(2100, 12, 31),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMMM(locale).format(date),
            titleTextStyle: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Color(0xff3888ff),
              shape: BoxShape.circle,
            ),
            markersMaxCount: 1,
            markersAlignment: Alignment.bottomCenter,
          ),
          eventLoader: (day) {
            return markedDates.where((date) =>
            date.year == day.year &&
                date.month == day.month &&
                date.day == day.day
            ).toList();
          },
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, day, events) {
              if (events.isNotEmpty) {
                return Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSameDay(day, today) ? Colors.white : const Color(0xff3888ff),
                    ),
                    width: 6,
                    height: 6,
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
