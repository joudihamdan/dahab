import 'package:flutter/material.dart';

const kBrownColor = Color(0xffAD8B73);
const kBeigeColor = Color(0xffE3CAA5);
const kCoffeeColor = Color(0xffCEAB93);
const kCreamColor = Color(0xffFFFBE9);

const double kImageRadious = 90.0;

BoxDecoration kDecoration = const BoxDecoration(
  borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      kCreamColor,
      kCoffeeColor,
      kBrownColor,
      kBrownColor,
    ],
  ),
);

const TextStyle kAppName = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 30,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle kAppBar = TextStyle(
    color: kCreamColor, fontWeight: FontWeight.w900, fontFamily: 'Montserrat');

const TextStyle kText = TextStyle(
  color: kBrownColor,
  fontWeight: FontWeight.w900,
  fontFamily: 'Montserrat',
  letterSpacing: 0.9,
);

BoxDecoration kContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: kBrownColor.withOpacity(0.3),
        spreadRadius: 3.0,
        blurRadius: 5.0,
      ),
    ]);

BoxDecoration kTextFieldContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(40)),
    boxShadow: [
      BoxShadow(
          color: kCoffeeColor.withOpacity(0.3),
          blurRadius: 3.0,
          spreadRadius: 2.3),
    ]);

const TextStyle kTextStyle = TextStyle(
    color: kBrownColor,
    fontSize: 20,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold);

const TextStyle kHintTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold);

BoxDecoration kButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(30),
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kBeigeColor,
      kCoffeeColor,
      kCoffeeColor,
      kBeigeColor,
    ],
  ),
  boxShadow: [
    BoxShadow(
      color: kCoffeeColor.withOpacity(0.5),
      spreadRadius: 3.0,
      blurRadius: 5.0,
    )
  ],
);

const kCardTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Montserrat',
  fontSize: 40,
  fontWeight: FontWeight.bold,
);
