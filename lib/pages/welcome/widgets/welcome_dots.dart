import 'package:back_in_line/data/notifiers.dart';
import 'package:flutter/material.dart';

// Dot Indicator Widget
Widget buildDotIndicator() {
  return ValueListenableBuilder<int>(
    valueListenable: currentWelcomePage,
    builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          bool isSelected = value == index;
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: isSelected ? 16 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          );
        }),
      );
    },
  );
}
