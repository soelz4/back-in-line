import 'dart:convert';
import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/data/reminder/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderManager {
  static Future<void> loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final remindersJson = prefs.getString('reminders');
    if (remindersJson != null) {
      final List<dynamic> decoded = jsonDecode(remindersJson);
      final loadedReminders = decoded.map((e) => Reminder.fromJson(e)).toList();
      remindersNotifier.value = loadedReminders;
    }
  }

  static Future<void> saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      remindersNotifier.value.map((e) => e.toJson()).toList(),
    );
    await prefs.setString('reminders', encoded);
  }

  static void addReminder(Reminder reminder) {
    final updated = [...remindersNotifier.value, reminder];
    remindersNotifier.value = updated;
    saveReminders();
  }

  static void updateReminder(int index, Reminder updatedReminder) {
    final updated = [...remindersNotifier.value];
    updated[index] = updatedReminder;
    remindersNotifier.value = updated;
    saveReminders();
  }

  static Future<void> loadSelectedReminder() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt('selectedReminderIndex');
    selectedReminderIndexNotifier.value = index;
  }

  static Future<void> saveSelectedReminder(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedReminderIndex', index);
    selectedReminderIndexNotifier.value = index;
  }

  static Future<void> clearSelectedReminder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedReminderIndex');
    selectedReminderIndexNotifier.value = null;
  }
}
