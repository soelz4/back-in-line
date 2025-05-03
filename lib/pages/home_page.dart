import 'package:back_in_line/data/consts.dart';
import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/pages/reminder_form_page.dart';
import 'package:back_in_line/pages/reminders_page.dart';
import 'package:back_in_line/pages/settings_page.dart';
import 'package:back_in_line/widgets/home/home_status.dart';
import 'package:back_in_line/widgets/home/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        title: const Text(
          "Back in Line",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReminderFormPage(),
                ),
              );
            },
            child: Tooltip(message: "Add Reminder", child: Icon(Icons.add)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RemindersPage()),
              );
            },
            child: Tooltip(message: "Reminders", child: Icon(Icons.list)),
          ),
          GestureDetector(
            child: Tooltip(message: "Profile", child: Icon(Icons.person)),
          ),
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, _) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () async {
                    isDarkModeNotifier.value = !isDarkModeNotifier.value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(
                      KeyConsts.themeModeKey,
                      isDarkModeNotifier.value,
                    );
                  },
                  child: Tooltip(
                    message: isDarkMode ? 'Dark Mode' : 'Light Mode',
                    child: Icon(
                      isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleSwitch(
              isOn: isOn,
              onChanged: (val) {
                setState(() => isOn = val);
              },
            ),
            const SizedBox(height: 10),
            HomeStatus(isOn: isOn),
          ],
        ),
      ),
    );
  }
}
