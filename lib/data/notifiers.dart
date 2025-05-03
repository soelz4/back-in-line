import 'package:back_in_line/data/reminder/reminder.dart';
import 'package:flutter/material.dart';

// Dark Mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);

// Welcome Page
ValueNotifier<int> currentWelcomePageNotifier = ValueNotifier<int>(0);

// Reminder
ValueNotifier<List<Reminder>> remindersNotifier = ValueNotifier<List<Reminder>>(
  [],
);
final ValueNotifier<int?> selectedReminderIndexNotifier = ValueNotifier<int?>(
  null,
);
