import 'package:flutter/material.dart';

class NonValidDate extends StatelessWidget {
  const NonValidDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Text(
          "Weekend is not available, please select another date",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}