import 'package:back_in_line/data/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePageContent extends StatelessWidget {
  final WelcomePageModel page;
  final double screenHeight;
  final double screenWidth;

  const WelcomePageContent({
    super.key,
    required this.page,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: screenHeight * 0.3,
            child:
                page.isLottie
                    ? Lottie.asset(page.assetPath, fit: BoxFit.contain)
                    : Image.asset(page.assetPath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 15),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: screenWidth - 100,
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
