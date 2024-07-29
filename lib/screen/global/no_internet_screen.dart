import 'package:dahab_clinic_management/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AssetsManager.wallPaper)),
        ),
        child:  Center(
          child: Lottie.asset('assets/lottie/noInternet.json')
        ),
      ),
    );
  }
}
