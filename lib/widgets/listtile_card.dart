import 'package:dahab_clinic_management/controllers/sessions_controller.dart';
import 'package:dahab_clinic_management/helper/sessions_dialogs.dart';
import 'package:dahab_clinic_management/screen/edit_booking_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListtileCard extends StatelessWidget {
  const ListtileCard(
      {super.key,
      required this.name,
      required this.date,
      required this.time,
      required this.sessionId,
      });
  final int sessionId;
  final String name;
  final String date;
  final String time;
 

  @override
  Widget build(BuildContext context) {
    SessionsController sessionsController = Get.put(SessionsController());

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10,),
            child: Text(
              name,
              style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color:  Theme.of(context).colorScheme.onSecondary ),
            ),
          ),
          subtitle: Text("$date\t\t$time"),
          contentPadding: const EdgeInsets.all(8),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => EditBookingScreen(
                    id: sessionId,
                      ));
                },
                icon:  Icon(
                  Icons.edit,
                  color:Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              IconButton(
                  onPressed: () {
                    showConfirmDeleteReservationDialog(sessionId);
                  },
                  icon:  Icon(
                    Icons.delete,
                    color:Theme.of(context).colorScheme.onPrimary,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
