import 'package:back_in_line/data/notifiers.dart';
import 'package:back_in_line/data/reminder/reminder.dart';
import 'package:back_in_line/data/reminder/reminder_manager.dart';
import 'package:back_in_line/pages/reminder_form_page.dart';
import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  void initState() {
    super.initState();
    ReminderManager.loadSelectedReminder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminders"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ValueListenableBuilder<List<Reminder>>(
        valueListenable: remindersNotifier,
        builder: (context, reminders, _) {
          if (reminders.isEmpty) {
            return const Center(child: Text("No reminders added yet."));
          }
          return ValueListenableBuilder<int?>(
            valueListenable: selectedReminderIndexNotifier,
            builder: (context, selectedIndex, _) {
              return ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: reminders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final reminder = reminders[index];
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      // Save the Selected Reminder Index
                      ReminderManager.saveSelectedReminder(index);
                      selectedReminderIndexNotifier.value = index;
                    },
                    child: Card(
                      elevation: isSelected ? 4 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? Colors.blue.withValues(
                                    alpha: 0,
                                    red: 0,
                                    green: 0,
                                    blue: 255,
                                  )
                                  : Theme.of(context).cardColor,
                          border: Border(
                            left: BorderSide(color: reminder.color, width: 8),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              reminder.name,
                              style: const TextStyle(fontSize: 15),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => ReminderFormPage(
                                          existingReminder: reminder,
                                          index: index,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ReminderFormPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
