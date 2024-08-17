import 'package:dahab_clinic_management/screen/Home%20page/profile.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RatingDialog extends StatefulWidget {
  final Function(int) onRatingSelected;

  const RatingDialog({super.key, required this.onRatingSelected});

  @override
  // ignore: library_private_types_in_public_api
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController reviewController = TextEditingController();

  Widget _buildStar(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _rating = index + 1;
            });
          },
          icon: Icon(
            Icons.star_rounded,
            color: index < _rating ? Colors.amber : Colors.grey,
          ),
          iconSize: 30,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.jCreamColor,
      title: Text(
        'Rate & Review',
        style: StyleManager.kAppBar.copyWith(
            color: ColorManager.kCoffeeColorDark, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
      
        children: [
          Text(
            'Leave Review to us please',
            style: StyleManager.normalText.copyWith(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: Form(
                  key: formState,
                  child: TextFormField(
                    controller: reviewController,
                    validator: (Value) {
                      if (Value!.isEmpty) {
                        return "can't submit empty review";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "add your review here",
                      border: OutlineInputBorder(
                        
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: ColorManager.jBrownColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: ColorManager.jBrownColor)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: StyleManager.ElevatedButtonStyle.copyWith(
              
                minimumSize: const WidgetStatePropertyAll(Size(100, 40))),
            onPressed: () {
              final String reviewtext = reviewController.text;
              if (reviewtext.isNotEmpty) {
                ratingController.addReview(reviewtext);
                reviewController.clear();
                Get.back();
                Get.snackbar('Thanks!', 'Review added successfully');
              } else {
                Get.snackbar('Error', 'Please fill all fields');
              }
            },
            child: Text(
              "add",
              style: StyleManager.buttunTextStyle,
            ),
          ),
          const SizedBox(height: 30.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'Rate us please',
                style: StyleManager.normalText.copyWith(
                    color: ColorManager.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => _buildStar(index)),
              ),
              ],
            )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onRatingSelected(_rating);
          },
          child: Text(
            'Submit',
            style: StyleManager.normalText
                .copyWith(color: ColorManager.jBrownColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
