import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/data/welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Main PageView Builder
Widget buildWelcomePageView(BuildContext context) => SizedBox(
  height: MediaQuery.of(context).size.height / 2.10,
  child: PageView.builder(
    controller: welcomePageViewController,
    itemCount: welcomePages.length,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildWelcomePageItem(context, index),
    onPageChanged: (value) {
      currentWelcomePage.value = value.toInt();
    },
  ),
);

/// Build each Page Item
Widget buildWelcomePageItem(BuildContext context, int index) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildWelcomeImage(index),
      // const SizedBox(height: 15),
      buildWelcomeTitle(index),
      const SizedBox(height: 5),
      buildWelcomeDescription(context, index),
    ],
  ),
);

/// Build Image or Lottie
Widget buildWelcomeImage(int index) {
  final page = welcomePages[index];
  return SizedBox(
    width: double.infinity,
    height: 250,
    child:
        page.isLottie
            ? Lottie.asset(page.assetPath, fit: BoxFit.contain)
            : Image.asset(page.assetPath, fit: BoxFit.contain),
  );
}

/// Build Title
Widget buildWelcomeTitle(int index) {
  final page = welcomePages[index];
  return Text(
    page.title,
    textAlign: TextAlign.center,
    style: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

/// Build Description
Widget buildWelcomeDescription(BuildContext context, int index) {
  final page = welcomePages[index];
  return SizedBox(
    width: MediaQuery.of(context).size.width - 100,
    child: Text(
      page.description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
