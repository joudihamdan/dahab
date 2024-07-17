import 'package:flutter/material.dart';

import '../../const/constant.dart';

Icon barIcon(BuildContext context, IconData icon) {
  return Icon(
    icon,
    color: kBrownColor,
    size: MediaQuery.of(context).size.height * 0.035,
  );
}