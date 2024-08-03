import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/color_manager.dart';

class CalendarTable extends StatefulWidget {
  const CalendarTable({super.key});

  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  DateTime today = DateTime.now();
  DateTime focuseDayy = DateTime.now();
  bool _dateSelected = false;
  bool _timeSelectd = false;
  bool _isWeekend = false;
  int? _currentIndex;
  CalendarFormat _format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        rowHeight: 40,
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          setState(() {
            today = selectedDay;
            focuseDayy = focusedDay;
            _dateSelected = true;
            if (selectedDay.weekday == 5) {
              _isWeekend = true;
              _currentIndex = null;
              _timeSelectd = false;
            } else {
              _isWeekend = false;
            }
          });
        },
        headerVisible: true,
        weekendDays: const [DateTime.friday],
        availableGestures: AvailableGestures.all,
        calendarStyle: const CalendarStyle(
            tablePadding: EdgeInsets.symmetric(vertical: 6),
            todayDecoration: BoxDecoration(
                color: ColorManager.jBrownColor, shape: BoxShape.circle)),
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: ColorManager.jBrownColor),
        ),
        onFormatChanged: (format) {
          setState(() {
            _format = format;
          });
        },
        calendarFormat: _format,
        focusedDay: focuseDayy,
        currentDay: today,
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2024, 8, 1),
      ),
    );
  }
}
