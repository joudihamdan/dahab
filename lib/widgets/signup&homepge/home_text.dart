import 'package:flutter/material.dart';

import '../../const/constant.dart';

Padding home_text(double height, double width, String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(text, style: kText.copyWith(fontSize: width * 0.05)),
    );
  }