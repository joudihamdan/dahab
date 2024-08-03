import 'package:dahab_clinic_management/helper/sessions_dialogs.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CompletedListtileCard extends StatelessWidget {
  const CompletedListtileCard(
      {super.key, required this.name, required this.date, required this.time, required this.id});
      final int id;
  final String name;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.kCreamColor,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: ColorManager.jBrownColor),
          ),
        ),
        subtitle: Text("$date\t\t$time"),
        contentPadding: const EdgeInsets.all(8),
        trailing: Container(
          decoration: BoxDecoration(
              color: ColorManager.jBrownColor,
              borderRadius: BorderRadius.circular(15)),
          child: TextButton(
            onPressed: () {
              showReviewDialog(id);
            },
            child: const Text(
              "Review",
              style: TextStyle(color: ColorManager.kWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
