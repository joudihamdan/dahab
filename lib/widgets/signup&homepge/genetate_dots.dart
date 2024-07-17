
import 'package:flutter/material.dart';

import '../../const/constant.dart';
import '../../screen/home_page.dart';

Row generate_category_dots(double height, int num) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        num,
        (index) => Container(
              margin: EdgeInsets.all(height * 0.004),
              child: Icon(
                Icons.circle,
                size: height * 0.012,
                color: pageNo1 == index ? kBrownColor : kBeigeColor,
              ),
            )),
  );
}

Row generate_service_dots(double height, int num) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        num,
        (index) => Container(
              margin: EdgeInsets.all(height * 0.004),
              child: Icon(
                Icons.circle,
                size: height * 0.012,
                color: pageNo2 == index ? kBrownColor : kBeigeColor,
              ),
            )),
  );
}
