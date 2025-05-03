import 'package:back_in_line/data/consts.dart';
import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/data/reminder/reminder_manager.dart';
import 'package:back_in_line/pages/splash_page.dart';
import 'package:back_in_line/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // First Page Widget
  late Future<bool> _firstTimeOpen;

  // initState
  @override
  void initState() {
    super.initState();
    _firstTimeOpen = _checkFirstTimeOpen();
    initThemeMode();
    ReminderManager.loadReminders();
    ReminderManager.loadSelectedReminder();
  }

  // initThemeMode
  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? theme = prefs.getBool(KeyConsts.themeModeKey);
    isDarkModeNotifier.value = theme ?? false;
  }

  // Decide which Page to Show Based on whether it's the First Time Opening the App
  Future<bool> _checkFirstTimeOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isFirstOpen = prefs.getBool(KeyConsts.firstOpenKey);

    if (isFirstOpen == null || isFirstOpen) {
      await prefs.setBool(KeyConsts.firstOpenKey, false);
      return true;
    } else {
      return false;
    }
  }

  // This Widget is the Root of your Application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: FutureBuilder<bool>(
            future: _firstTimeOpen,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // You can return a loading widget here if you want
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Handle error if needed
                return const Center(child: Text("Error Loading App"));
              } else {
                // After checking, show the appropriate page
                return snapshot.data == true
                    ? const WelcomePage()
                    : const SplashPage();
              }
            },
          ),
        );
      },
    );
  }
}
