import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/style_maneger.dart';

class MakeAppointmentButton extends StatelessWidget {
  const MakeAppointmentButton({super.key, required this.timeSelectd, required this.dateSelected});

  final bool timeSelectd;
  final bool dateSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
        horizontal: 20),
    child: SizedBox(
    height: 40,
    width: double.infinity,
    child:
    ElevatedButton(
    onPressed: timeSelectd & dateSelected ?
    () {} : null,
    style: StyleManager.ElevatedButtonStyle,
    child: Text("Make Appointment",
    style: StyleManager.buttunTextStyle,),
    )
    )
    );
  }
}
