import 'package:flutter/material.dart';

import '../../const/constant.dart';

Stack categories_card(double width, double height, String img, String text) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          color: Colors.black,
          width: width * 0.60,
          height: height * 0.30,
          child: Opacity(
            opacity: 0.46,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 0.3,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.032,
            top: height * 0.015,
            right: width * 0.03,
          ),
          child: Text(
            text,
            style: kCardTextStyle,
          ),
        ),
      ),
    ],
  );
}

Stack service_card(double width, double height, String img, String text) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          color: Colors.black,
          width: width * 0.40,
          height: height * 0.15,
          child: Opacity(
            opacity: 0.46,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
        top: 0.3,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.032,
            top: height * 0.015,
            right: width * 0.03,
          ),
          child: Text(
            text,
            style: kCardTextStyle.copyWith(fontSize: 20),
          ),
        ),
      ),
    ],
  );
}
