import 'package:dahab_clinic_management/controllers/sessions_controller.dart';
import 'package:dahab_clinic_management/helper/dialogs.dart';
import 'package:dahab_clinic_management/models/response/sessions_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/screen/Home%20page/sessions_screen.dart';
import 'package:dahab_clinic_management/screen/global/no_data_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/listtile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnProgressScreen extends StatefulWidget {
  const OnProgressScreen({super.key});

  @override
  State<OnProgressScreen> createState() => _OnProgressScreenState();
}

class _OnProgressScreenState extends State<OnProgressScreen> {
  final SessionsController controller = Get.put(SessionsController());

  @override
  void initState() {
    controller.getApprovedSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.resultModel.value is ListOf<SessionsModel>) {
          return ListView.builder(
            itemCount: (controller.resultModel.value as ListOf<SessionsModel>)
                .resutl
                .length,
            itemBuilder: (context, index) {
              return ListtileCard(
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

