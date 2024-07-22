import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/specialist_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  DateTime today = DateTime.now();
  DateTime focuseDayy = DateTime.now();
  bool _dateSelected = false;
  bool _timeSelectd = false;
  bool _isWeekend = false;
  int? _currentIndex;
  CalendarFormat _format = CalendarFormat.month;

  List<List<String>> times = [
    ["9:00-11:00", "10:30-11:00", "11:30-12:00"],
    ["9:00-9:30", "10:00-10:30", "10:30-11:00", "11:30-12:00", "12:00-12:30"],
    ["9:00-11:00", "10:30-11:00", "11:30-12:00", "12:00-12:30"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.jBrownColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25.0),
        child: AppBar(
          backgroundColor:  ColorManager.jBrownColor,
          leading: LeadingIcon(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SpecialistCard(),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 500,
              decoration: const BoxDecoration(
                  color: ColorManager.kCoffeeColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //   Text("Choose your appointment",style: StyleManager.normalText().copyWith(color: ColorManager.jBrownColor),),
                  _buildTableCalender(),
                  _isWeekend ? _buildNonValidDay() : _buildHoursShift(),
                  const Spacer(),
                  MakeAppointmentButton(
                      timeSelectd: _timeSelectd),
                  const Spacer(),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _buildHoursShift() {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    _timeSelectd = true;
                  });
                },
                child: Container(
                  // width: 50,
                  // height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _currentIndex == index
                            ? ColorManager.kBrownColor
                            : ColorManager.kWhiteColor,
                      ),
                      color: _currentIndex == index
                          ? ColorManager.kBrownColor
                          : null),
                  child: Center(
                    child: Text(
                      "9:00 - 11:00",
                      style: TextStyle(
                          fontSize: 12,
                          color: _currentIndex == index
                              ? ColorManager.jBrownColor
                              : ColorManager.blackColor),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Container _buildNonValidDay() {
    return Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Text(
          "Weekend is not available, please select another date",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container _buildTableCalender() {
    return Container(
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        rowHeight: 33,
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
