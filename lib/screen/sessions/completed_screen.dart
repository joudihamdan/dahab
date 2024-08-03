import 'package:dahab_clinic_management/controllers/sessions_controller.dart';
import 'package:dahab_clinic_management/models/sessions_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/screen/global/no_data_screen.dart';
import 'package:dahab_clinic_management/widgets/completed_listtile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedScreen extends StatelessWidget {
  CompletedScreen({super.key});
  final SessionsController controller = Get.put(SessionsController());

  @override
  Widget build(BuildContext context) {
    controller.getCompletedSession();
    return Obx(
      () {
        if (controller.resultModel.value is ListOf<SessionsModel>) {
          return ListView.builder(
            itemCount: (controller.resultModel.value as ListOf<SessionsModel>)
                .resutl
                .length,
            itemBuilder: (context, index) {
              return CompletedListtileCard(
                  id: (controller.resultModel.value as ListOf<SessionsModel>)
                      .resutl[index]
                      .id,
                  name: (controller.resultModel.value as ListOf<SessionsModel>)
                      .resutl[index]
                      .service,
                  date: (controller.resultModel.value as ListOf<SessionsModel>)
                      .resutl[index]
                      .date,
                  time: (controller.resultModel.value as ListOf<SessionsModel>)
                      .resutl[index]
                      .time);
            },
          );
        } else if (controller.resultModel.value is EmptyResult) {
          return const Center(child: Text("No session"));
        } else if (controller.resultModel.value is ExceptionResult) {
          return const NoDataScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
