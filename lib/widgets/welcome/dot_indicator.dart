import 'package:back_in_line/data/welcome/welcome.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(welcomePages.length, (index) {
        final isSelected = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isSelected ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
