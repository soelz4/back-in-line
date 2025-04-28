import 'package:flutter/material.dart';

// Dark Mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);

// Welcome Page
ValueNotifier<int> currentWelcomePage = ValueNotifier<int>(0);
PageController welcomePageViewController = PageController(
  viewportFraction: 1.0,
);
