import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/models/service_model.dart';
import 'package:dahab_clinic_management/screen/book_screen.dart';
import 'package:dahab_clinic_management/utils/assets_manager.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}
class _ServiceScreenState extends State<ServiceScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
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
      //backgroundColor: ColorManager.jCreamColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsManager.testImg),
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
                child: LeadingIcon()),
            Positioned(
              top: 10,
              left: 150,
              child: Text(
                widget.serviceModel.name,
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
                borderRadius: BorderRadius.vertical(top:Radius.circular(25) ),

              ),

              child: Column(
                children: [
                  const SizedBox(height: 30.0),

                  Text(
                    "\$${widget.serviceModel.price}",
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.serviceModel.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  const Spacer(flex: 5,),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(BookScreen());
                    },
                    style: StyleManager.ElevatedButtonStyle,
                    child:  Text(
                      'Book Appointment',
                      style: StyleManager.buttunTextStyle  ),
                    ),
                  const Spacer(flex: 1,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
