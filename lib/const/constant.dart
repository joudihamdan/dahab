import 'package:flutter/material.dart';

String token =
"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2E3YTMyMmRhYmE5YjYyZWQyMzk1YmUyYzFmMGVkODYwOWMxNGQxNDQ1ZTliN2M0MzI5YmRhN2I4MzEyMzZjOTRlNTlhZmVlM2U0MDc2MjIiLCJpYXQiOjE3MjIxODgxNTMuNTUzMDY2LCJuYmYiOjE3MjIxODgxNTMuNTUzMDY5LCJleHAiOjE3NTM3MjQxNTMuNTQ1MjMsInN1YiI6IjYiLCJzY29wZXMiOltdfQ.rGwvSaxDpyQtxexxF4mCLXrDMUE4mj5oA-0aQJLKMEhnZhjJ6LM0ZwU9Ocj2zniKQdSTeB4_2zmorXDD5LXf_bpGgySVeIOW4DuKKwYZcTD5nAPJ5SLKHaUtGlmiWDrkZSfnrZqSSlRD-6i8XrvyaYZmKfxjj7l_MMaz1tXxYR75ecEriqiuA9iNZgtuO1UScGR8EJEAZp6CJ4Pri5xNoLvXtkBcssaWlD108TVVUovOMABMIX11n3ODOivRVJrt9Xz19S8EzOt42i-UXpHSS9dGfWNkKtEK85C0_hbiOC5OnXBGWzVSNvKQM_rBHu2eQDFVWaVSSbVxutPiuXWFOjR4CwNJpKzlvvwFX2Zw8wxkD7CfIdxAMOECAl_T9l2iFkcLTXjxeIq1I4mdFl7IvQ-jOLHEFocrqTXhkv5gMJXzhqpyQEaz3T27doI2AMmJBaAimkA8VMlIAmbOUFb39fx5pA6Eks9M68oI1fZUvaohXF44PImnlNwlJXomaGYqiXMrUymKp3wVO1ZM09upAcibazCyU-1ejxSzedQl9Cla5u3tsVmylV84YYayPXrDugZHC-dKP1z2f6VijPpv2hnWdA5oY7KHKrKeNjhXbj-5TU33SqYYqjDdlQ92AwYOodiaeFpmJZXD6InoKjDxdRTCPDtOvBQ42GQqk3aekaw";
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
