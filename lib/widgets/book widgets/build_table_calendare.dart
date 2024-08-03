import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BuildTableCalendar extends StatelessWidget {
  const BuildTableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final ReversationController reversationController = Get.put(ReversationController());

    return Obx((){
      return TableCalendar(
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      rowHeight: 33,
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        reversationController.onDaySelected(selectedDay, focusedDay);
      },
      headerVisible: true,
      weekendDays: const [DateTime.friday],
      calendarStyle: const CalendarStyle(
          tablePadding: EdgeInsets.symmetric(vertical: 6),
          todayDecoration: BoxDecoration(
              color: ColorManager.jBrownColor, shape: BoxShape.circle)),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: ColorManager.jBrownColor),
      ),
      focusedDay: reversationController.focusedDay.value,
      currentDay: reversationController.today.value,
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(
        const Duration(days: 30),
      ),
    );
    });
  }
}
