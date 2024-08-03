import 'package:flutter/material.dart';

String token =
"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWQ3MTM3N2YzNjVjNTRhZWExNTk4NWE3ZmRlNzk2Mjc3MTgxNzk1ZmQyNjQ4OTRkNzM4Mjg4M2E0M2YxYjBhODA5MzAzNzg5NjlkYzdmMGIiLCJpYXQiOjE3MjI1ODI1MDkuOTg4MTEyLCJuYmYiOjE3MjI1ODI1MDkuOTg4MTE4LCJleHAiOjE3NTQxMTg1MDkuOTY5OTcyLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.NXVv5R-eCXH7QC8iHV5b-RrAX9_OHvIth22pQzSwy5B70vjti4g8tFyg8vL4qmiu-nDb9vhrCVjxZq5GC3CPhdqy-vR4615DLnIhP_PuFuOPnXGahuRoF6x5g6M3OQhRF5WJhaFo3qOi0d-x-6aZou1d71DX9JGD7q173rQhsC7iQVb4kqF_c7PMIZWwGWnvKxd3VuBfiW9ocJtaNo_pZR9gD42SedPI9578-__QDgeRCWDA83u_qSVN42OSWwObVaDWtmzzjfc_PrZPE9TVBUOuXdbtZ1JhNKL7eLiAw2y8uK9pXZYbrAGefuKulAMhcLyQvkvFVD_0hcac62RoySVBHYWkiNmyDoKat75dVzhDG1eUq5m74k5UZqEiw3WdMLmm9gBHWyAsZj6euFwtUoZwdB_GZNC4D6vmML74V1VtgLL7JNIQAx4Dmi1g6n-rCx3rvuQfE6sjdVncNVz_5L2MsJ9v2SQ03usEGjoW-UKZu6x3WrfYHnj8TdeU0PzibeNHtotV2kcbZDD-3CSAQS9aqAlpD2IZh2s-NED8hhx79AXUT1GmQdPur9gaVx67PyM3xoaT9xfHVOdImnecI4JPTTXFR1U_FxfeHIj_3MRyeIUxFYO0G7Wr6F9cvVqbo8jTr6hwpnIMLmPLEQJWTaui5VVGQEC6mpdu9SqzkAM";
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
