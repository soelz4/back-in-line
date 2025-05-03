import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/data/reminder/reminder.dart';
import 'package:flutter/material.dart';

class HomeStatus extends StatelessWidget {
  const HomeStatus({super.key, required this.isOn});

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          isOn ? "Reminder is Currently ON" : "Reminder is Currently OFF",
          style: theme.textTheme.bodyMedium?.copyWith(),
        ),
        Text(
          "Press Button to Toggle Reminder",
          style: theme.textTheme.bodyMedium?.copyWith(),
        ),
        ValueListenableBuilder<int?>(
          valueListenable: selectedReminderIndexNotifier,
          builder: (context, selectedIndex, _) {
            String selectedReminderName = "No reminder selected";
            if (selectedIndex != null && selectedIndex >= 0) {
              final reminders = remindersNotifier.value;
              if (selectedIndex < reminders.length) {
                selectedReminderName = reminders[selectedIndex].name;
              }
            }
            return RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Selected Reminder ~> ",
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15),
                  ),
                  TextSpan(
                    text: selectedReminderName,
                    style: TextStyle(
                      color:
                          Colors
                              .teal, // Teal color for the selected reminder name
                      fontWeight:
                          FontWeight
                              .bold, // Bold font for the selected reminder name
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<int?>(
              valueListenable: selectedReminderIndexNotifier,
              builder: (context, selectedIndex, _) {
                return ValueListenableBuilder<List<Reminder>>(
                  valueListenable: remindersNotifier,
                  builder: (context, reminders, _) {
                    final isSoundOn =
                        selectedIndex != null &&
                                selectedIndex >= 0 &&
                                selectedIndex < reminders.length
                            ? reminders[selectedIndex].soundEnabled
                            : false;

                    return Tooltip(
                      message:
                          isSoundOn
                              ? 'Sound Reminder On'
                              : 'Sound Reminder Off',
                      child: Icon(
                        isSoundOn ? Icons.volume_up : Icons.volume_off,
                        color: isSoundOn ? Colors.blue : Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(width: 5),
            ValueListenableBuilder<int?>(
              valueListenable: selectedReminderIndexNotifier,
              builder: (context, selectedIndex, _) {
                return ValueListenableBuilder<List<Reminder>>(
                  valueListenable: remindersNotifier,
                  builder: (context, reminders, _) {
                    final isVibrationOn =
                        selectedIndex != null &&
                                selectedIndex >= 0 &&
                                selectedIndex < reminders.length
                            ? reminders[selectedIndex].vibrationEnabled
                            : false;

                    return Tooltip(
                      message:
                          isVibrationOn
                              ? 'Vibration Reminder On'
                              : 'Vibration Reminder Off',
                      child: Icon(
                        Icons.vibration,
                        color: isVibrationOn ? Colors.blue : Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(width: 5),
            ValueListenableBuilder<int?>(
              valueListenable: selectedReminderIndexNotifier,
              builder: (context, selectedIndex, _) {
                return ValueListenableBuilder<List<Reminder>>(
                  valueListenable: remindersNotifier,
                  builder: (context, reminders, _) {
                    final isWalkOn =
                        selectedIndex != null &&
                                selectedIndex >= 0 &&
                                selectedIndex < reminders.length
                            ? reminders[selectedIndex].walkReminderEnabled
                            : false;
                    return Tooltip(
                      message:
                          isWalkOn ? 'Walk Reminder On' : 'Walk Reminder Off',
                      child: Icon(
                        Icons.directions_walk,
                        color: isWalkOn ? Colors.blue : Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 5), // Add some space before reminder name
      ],
    );
  }
}
