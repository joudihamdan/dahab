import 'package:dahab_clinic_management/controllers/service_controller.dart';
import 'package:dahab_clinic_management/models/service_details_response_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/screen/global/no_data_screen.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/screen/booking_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServiceScreen extends StatefulWidget {
  ServiceScreen({super.key, required this.id, this.cat_id});
  final int id;
  int? cat_id;
  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final serviceDeController = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
    serviceDeController.getServicesDetails(widget.id);
    _controller = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.jCreamColor,
      body: Obx(
        () {
          if (serviceDeController.resultModel.value
              is ServiceDetailsResponseModel) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.network(
                          "$baseUrlImage${(serviceDeController.resultModel.value as ServiceDetailsResponseModel).image}",
                          errorBuilder: (context, error, stackTrace) =>
                              const FlutterLogo(),
                        ).image,
                        fit: BoxFit.fill),
                  ),
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            ColorManager.jBrownColor.withOpacity(0.7),
                            ColorManager.kCoffeeColor.withOpacity(0.6),
                            ColorManager.kCreamColor.withOpacity(0.1),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 20,
                  left: 10,
                  child: LeadingIcon(),
                ),
                Positioned(
                  top: 90,
                  left: 50,
                  child: Text(
                    (serviceDeController.resultModel.value
                            as ServiceDetailsResponseModel)
                        .name,
                    style: StyleManager.kAppBar,
                  ),
                ),
                Positioned(
                  top: 175,
                  child: SlideTransition(
                    position: _animation,
                    child: const Text(
                      maxLines: 2,
                      '10% discount on your first session',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kWhiteColor),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.only(top: 230),
                  decoration: const BoxDecoration(
                    color: ColorManager.jCreamColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      Text(
                        " ${(serviceDeController.resultModel.value as ServiceDetailsResponseModel).price} SYP",
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        (serviceDeController.resultModel.value
                                as ServiceDetailsResponseModel)
                            .description,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      const Spacer(
                        flex: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(BookScreen(
                            serviceId: widget.id,
                          ));
                        },
                        style: StyleManager.ElevatedButtonStyle,
                        child: Text('Book Appointment',
                            style: StyleManager.buttunTextStyle),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (serviceDeController.resultModel.value is ExceptionResult) {
            return const NoDataScreen();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
