import 'package:flutter/material.dart';

String token =
//sever token
   // "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI1IiwianRpIjoiMjBlZDAxNTViZDdlYTQ4ZTAyNzlmNmQ3OWQ2Y2VmMGVlZDI4ZWIwMzgwOWRjZDhlMjkwNjBmZGRjMGQ1M2NlYjllODYwYjVlN2ZlNjM5OWYiLCJpYXQiOjE3MjM3MTYwOTIuODY2NjgxLCJuYmYiOjE3MjM3MTYwOTIuODY2Njk2LCJleHAiOjE3NTUyNTIwOTIuODYzMDA5LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.UnI8E3o2CbTuOFipCM8OGsY7wjawWmL3HqrGl-vTJeYGofk8h7qQynTMofnbwiaLwLrmAjl0uSsjRW3OGkNrZAodLkkjfxOxNNV0n7emsKhPC0TVqlU_vNiE0k-cHsdPMcvQ8wPwsDq-S9Af2g2qHqfhb6St69_52ptP1iP39BhT-eCWylCdt0B9zbMNnB6eCLK0Qxm7dZO-9CtxYhThrF9a8uOQLeHQ5yH1XE8ubKE5lDjhvjtEZBoaM-spLvrcv4wwS_Vjvbi2YznA4ZL-KvsewQ-yHb3AXoHCqLR25yyrLiXeWempObHKT5gvD7FqIXC1ziCxE8uwShNVB4KqP3n7YR3gts0z205UuNnTwOajTSYim-ExcTZSqjhL8f06-sVNNJA62MmPSAr2L9nNUX8M2Lg6PvPaH76aEY0ychnzXzcxnvrPN2o1qirhdlvPDY1EB9yHc_3Qt5Nmf5kLpXRx4Pw7c_ai2t-IWUwu2V8n3B4nOsodQ6LHQ45pcD1jeaw9xFPvFD2SC6K-saPfUKoKs-hcMC4brTbRR_1X0FghifscHvbwx5pOhL_MRX-P5IFwVJGAQtDC7iDecNd6cEdotG77-2Rnp9hjIgeH8gr5h0OCO-oHNpFnDZxX0odeswuhqnS2NVP4AfVntKsgJR_TJsFpKuZhEKsbuZ7R56c";
//local token
"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTI0NzRhNWE0MzM1OGQ2ZjVhMmJkNjA2YzlkN2M3ZjQ2ZGZjYTgyYmU4Y2QzYzM0Yzg4YTkxOGM2MzNmZmFlMDI5NTNmNjNlMTJjMDk2ZTMiLCJpYXQiOjE3MjM3OTMwNjUuMjAwMjcxLCJuYmYiOjE3MjM3OTMwNjUuMjAwMjc3LCJleHAiOjE3NTUzMjkwNjQuNzY1MjYxLCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.K9RzG2BdkwjI0czkEYqJi70BDtyHrgeILLIQ5zx39OWKtKLL3Pfir0GQYjF18Msu5vpBqCX5OWOp7eExR_t_jHGKvCzFpHcloDsy9r8gGGDpVGQT6-ARVJUFT45Q-zgE4IsRm5oSv-HFVi_seMBGdOAmCS39nn_XqD4oPjKKtjMTt9UoWfCp7fKWwSd2Ox0Yc8LTDpjjZTUA65mQaJz7rBg5o4DcESV8j3L_Dol-SaTnqtxnD1jY64LomFTFx3hrhAZA4V7QILdxw6BvNm8SgGq1uM599VTge_8ohxxtpvuQ3jELd-yxoxuvkFWfQ4RGjV5n92JpTvPsQXDyUUq6xYraaafr1McWDdAzq88WlaTB78vz0RdGMdm3z0Ldb8T-tQd0NjZMRajGshn49gdcjwPSN7PiFcsEGG8Hwtq1jmu0bkLxmXEp8HHTyoEu3ttR3r2oQIzr6_0xqqfCzGdEDVBm344KlRAalGoGROgeMapLMDJzn9Wmjy0Jyy1cldoKWFrAwGpRYz0KCyZedS65f3xbOG1KqskPqapoB2Heq18WqwHmML1nFWk_Dac_az0Tvsm9qJxALGkOlzI8Bf9Pok_VnxzxKFx3QDliqf8oFCggX_Ruudt_EKbJKYZOraW70qBrztvYb-Pt4Uk4C1MZ1KEQkdfHz95vRmkJENN52uA";
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
