import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  final Function(int) onRatingSelected;

  const RatingDialog({super.key, required this.onRatingSelected});

  @override
  // ignore: library_private_types_in_public_api
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _rating = 0;

  Widget _buildStar(int index) {
    return Row(
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
      title:  Text('Rate us',style: StyleManager.kAppBar.copyWith(color: ColorManager.kCoffeeColorDark,fontWeight: FontWeight.bold),),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) => _buildStar(index)),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onRatingSelected(_rating);
          },
          child:  Text('Submit',style: StyleManager.normalText.copyWith(color: ColorManager.kCoffeeColorDark,fontSize: 16),),
        ),
      ],
    );
  }
}
