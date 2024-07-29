import 'package:dahab_clinic_management/controllers/connect_controller.dart';
import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/screen/global/no_internet_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/specialist_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.serviceId});
  final int serviceId;

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

  ConnectivityController connectivityController =Get.put(ConnectivityController());
  SpecialistController specialistController = Get.put(SpecialistController());
  ReversationController reversationController =Get.put(ReversationController());

  @override
  void initState() {
    print(focuseDayy);
    reversationController.getShiftTimesByDate(widget.serviceId,(specialistController.selectedIndex.value+1),formatDate(focuseDayy));
    print(connectivityController.isConnected.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (connectivityController.isConnected.value == true) {
          return Scaffold(
              backgroundColor: ColorManager.jBrownColor,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(25.0),
                child: AppBar(
                  backgroundColor: ColorManager.jBrownColor,
                  leading: const LeadingIcon(),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SpecialistCard(
                    serviceId: widget.serviceId,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: ColorManager.kCoffeeColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildTableCalender(),
                          _isWeekend ? _buildNonValidDay() : _buildHoursShift(),
                          const Spacer(),
                          MakeAppointmentButton(timeSelectd: _timeSelectd),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        } else {
          return const NoInternetScreen();
        }
      },
    );
  }


  Widget _buildHoursShift() {

    return Obx((){
      if(reversationController.resultModel.value is ListOf<ShiftTimeModel>){
        return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: GridView.builder(
              itemCount:(reversationController.resultModel.value as ListOf <
                          ShiftTimeModel>).resutl.length,
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
                              (reversationController.resultModel.value as ListOf <
                          ShiftTimeModel>).resutl[index].time,
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
      ),
    );
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    });
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


  Widget _buildTableCalender() {
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
        lastDay: DateTime.now().add(
          const Duration(days: 30),
        ),
      ),
    );
  }
}
