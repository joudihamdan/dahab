import 'package:carousel_slider/carousel_slider.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/spacialist_model.dart';
import '../utils/color_manager.dart';

class SpecialistCard extends StatefulWidget {
  const SpecialistCard({super.key});

  @override
  State<SpecialistCard> createState() => _SpecialistCardState();
}

class _SpecialistCardState extends State<SpecialistCard> {
  int activeIndex = 0;
  final List<SpecialistModel> specialists = [
    SpecialistModel(
      name: 'Dr. John Doe',
      specialty: 'Cardiologist',
      experience: '10 years',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    SpecialistModel(
      name: 'Dr. Jane Smith',
      specialty: 'Dermatologist',
      experience: '8 years',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    SpecialistModel(
      name: 'Dr. Michael Johnson',
      specialty: 'Pediatrician',
      experience: '12 years',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[ CarouselSlider.builder(
          itemCount: specialists.length,
          itemBuilder: (context, index, realindex) {
            final SpecialistModel specialist = specialists[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(specialist.imageUrl),
                  radius: 50,
                ),
                SizedBox(height: 8),
                Text(specialist.name,style: StyleManager.normalText.copyWith(color: ColorManager.kCreamColor),),
                Text(specialist.specialty,style: TextStyle(color: ColorManager.kCreamColor),),
                Text(specialist.experience,style: TextStyle(color: ColorManager.kCreamColor),),
              ],
            );
          },
          options: CarouselOptions(height: 190,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
        ),
         // SizedBox(height: 10,),
          AnimatedSmoothIndicator(
              effect: const ExpandingDotsEffect(
                  dotWidth: 10,activeDotColor: ColorManager.kCreamColor,dotHeight: 5
              ),
              activeIndex: activeIndex, count:specialists.length ),
        ]
    );
  }
}


