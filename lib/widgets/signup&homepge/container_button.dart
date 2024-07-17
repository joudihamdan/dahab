import 'package:flutter/material.dart';

import '../../const/constant.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kButtonDecoration,
      height: height * 0.052,
      width: width * 0.55,
      child: child,
    );
  }
}

class FacebookButton extends StatelessWidget {
  FacebookButton({
    Key? key,
    required this.height,
    required this.width,
    required this.onpressed,
  }) : super(key: key);

  final double height;
  final double width;
  dynamic onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xff1877f2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 4.0,
          )
        ],
      ),
      height: height * 0.052,
      width: width * 0.55,
      child: TextButton(
          onPressed: onpressed,
          child: Text(
            'Facebook',
            style: kTextStyle.copyWith(
              fontSize: height * 0.028,
              color: Colors.white,
            ),
          )),
    );
  }
}
