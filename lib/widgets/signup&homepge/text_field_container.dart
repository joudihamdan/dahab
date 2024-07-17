import 'package:flutter/material.dart';

import '../../const/constant.dart';

class TextFieldContainer extends StatelessWidget {
  final bool obsecure;
  final String text;
  final TextInputType type;
  final dynamic controller;
  final dynamic onsaved;
  final dynamic validator;
  final dynamic icon;

  const TextFieldContainer({
    Key? key,
    required this.text,
    required this.type,
    required this.obsecure,
    this.controller,
    this.onsaved,
    this.validator,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          // alignment: Alignment.center,
          height: screen.height * 0.055,
          width: screen.width * 0.75,
          decoration: kTextFieldContainer,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.055),
            child: TextFormField(
              cursorColor: kBrownColor,
              textAlign: TextAlign.center,
              keyboardType: type,
              obscureText: obsecure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: kHintTextStyle,
                suffixIcon: icon,
              ),
              controller: controller,
              onSaved: onsaved,
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
