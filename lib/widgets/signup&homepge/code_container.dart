import 'package:flutter/material.dart';

import '../../const/constant.dart';

class CodeContainer extends StatelessWidget {
  const CodeContainer({
    Key? key,
    required this.height,
    required this.width,
    this.onsaved,
    this.controller,
    this.validator,
  }) : super(key: key);

  final double height;
  final double width;
  final dynamic onsaved;
  final dynamic controller;
  final dynamic validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.002),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: height * 0.09,
      width: width * 0.122,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        cursorColor: kBrownColor,
        style: const TextStyle(color: Colors.green),
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        controller: controller,
        validator: validator,
        onSaved: onsaved,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: kBrownColor, style: BorderStyle.none)),
        ),
      ),
    );
  }
}
