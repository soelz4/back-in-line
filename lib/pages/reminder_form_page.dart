import 'package:back_in_line/data/consts.dart';
import 'package:back_in_line/data/reminder/reminder.dart';
import 'package:back_in_line/data/reminder/reminder_manager.dart';
import 'package:back_in_line/widgets/reminder/color_picker_bottom_sheet.dart';
import 'package:back_in_line/widgets/reminder/day_selector.dart';
import 'package:back_in_line/widgets/reminder/posture_reminder.dart';
import 'package:back_in_line/widgets/reminder/sound_toggle.dart';
import 'package:back_in_line/widgets/reminder/time_picker.dart';
import 'package:back_in_line/widgets/reminder/vibration_toggle.dart';
import 'package:back_in_line/widgets/reminder/walk_reminder.dart';
import 'package:flutter/material.dart';

class ReminderFormPage extends StatefulWidget {
  const ReminderFormPage({super.key, this.existingReminder, this.index});

  final Reminder? existingReminder;
  final int? index;

  @override
  State<ReminderFormPage> createState() => ReminderFormPageState();
}

class ReminderFormPageState extends State<ReminderFormPage> {
  // Temporary switch values
  late bool tempIsSoundEnabled;
  late bool tempIsVibrationEnabled;
  late bool tempIsWalkReminderEnabled;

  // Color
  Color selectedColor = Colors.blue;

  // Name
  final TextEditingController nameController = TextEditingController();
  late String name;
  bool isNameInvalid = false;

  // Posture Reminder
  int postureReminderInterval = 1;
  late final TextEditingController postureController;
  final postureFocusNode = FocusNode();
  bool isPostureInvalid = false;

  // Walk Reminder
  int walkReminderInterval = 1;
  late final TextEditingController walkController;
  final walkFocusNode = FocusNode();
  bool isWalkInvalid = false;

  // Time and Day
  List<String> selectedDays = [];
  TimeOfDay startAt = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endAt = TimeOfDay(hour: 21, minute: 0);

  // Increment Posture
  void incrementPosture() {
    if (postureReminderInterval < 99) {
      setState(() {
        postureReminderInterval++;
        postureController.text = postureReminderInterval.toString();
        isPostureInvalid = false;
      });
    }
  }

  // Decrement Posture
  void decrementPosture() {
    if (postureReminderInterval > 0) {
      setState(() {
        postureReminderInterval--;
        postureController.text = postureReminderInterval.toString();
        isPostureInvalid = false;
      });
    }
  }

  // Posture Text Change
  void onPostureTextChanged(String val) {
    final num = int.tryParse(val);
    if (num != null && num >= 0 && num <= 99) {
      setState(() {
        postureReminderInterval = num;
        isPostureInvalid = false;
      });
    } else {
      setState(() => isPostureInvalid = true);
    }
  }

  // Increment Walk
  void incrementWalk() {
    if (walkReminderInterval < 99) {
      setState(() {
        walkReminderInterval++;
        walkController.text = walkReminderInterval.toString();
        isWalkInvalid = false;
      });
    }
  }

  // Decrement Walk
  void decrementWalk() {
    if (walkReminderInterval > 0) {
      setState(() {
        walkReminderInterval--;
        walkController.text = walkReminderInterval.toString();
        isWalkInvalid = false;
      });
    }
  }

  // Walk Text Change
  void onWalkTextChanged(String val) {
    final num = int.tryParse(val);
    if (num != null && num >= 0 && num <= 99) {
      setState(() {
        walkReminderInterval = num;
        isWalkInvalid = false;
      });
    } else {
      setState(() => isWalkInvalid = true);
    }
  }

  @override
  void initState() {
    super.initState();

    final r = widget.existingReminder;

    nameController.text = r?.name ?? '';
    selectedColor = r?.color ?? Colors.blue;
    postureReminderInterval = r?.postureInterval ?? 1;
    walkReminderInterval = r?.walkInterval ?? 1;

    tempIsSoundEnabled = r?.soundEnabled ?? false;
    tempIsVibrationEnabled = r?.vibrationEnabled ?? false;
    tempIsWalkReminderEnabled = r?.walkReminderEnabled ?? false;

    selectedDays = r?.days ?? [];
    startAt = r?.startAt ?? TimeOfDay(hour: 9, minute: 0);
    endAt = r?.endAt ?? TimeOfDay(hour: 21, minute: 0);

    postureController = TextEditingController(
      text: postureReminderInterval.toString(),
    );
    walkController = TextEditingController(
      text: walkReminderInterval.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existingReminder != null ? "Edit Reminder" : "New Reminder",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ColorPickerCircle(
                selectedColor: selectedColor,
                availableColors: AppColor.availableColors,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  errorText: isNameInvalid ? 'Name is Required' : null,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          isNameInvalid
                              ? Colors.red
                              : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isNameInvalid ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                    isNameInvalid =
                        false; // Clear error when user starts typing
                  });
                },
              ),
              SizedBox(height: 10),
              PostureReminderRow(
                controller: postureController,
                focusNode: postureFocusNode,
                isInvalid: isPostureInvalid,
                onIncrement: incrementPosture,
                onDecrement: decrementPosture,
                onTextChanged: onPostureTextChanged,
              ),
              SoundToggleRow(
                value: tempIsSoundEnabled,
                onChanged: (bool? value) {
                  setState(() {
                    tempIsSoundEnabled = value ?? false;
                  });
                },
              ),
              VibrationToggleRow(
                value: tempIsVibrationEnabled,
                onChanged: (bool? value) {
                  setState(() {
                    tempIsVibrationEnabled = value ?? false;
                  });
                },
              ),
              WalkReminderRow(
                isEnabled: tempIsWalkReminderEnabled,
                interval: walkReminderInterval,
                controller: walkController,
                focusNode: walkFocusNode,
                isInvalid: isWalkInvalid,
                onToggle: (bool? value) {
                  setState(() {
                    tempIsWalkReminderEnabled = value ?? false;
                  });
                },
                onIncrement: incrementWalk,
                onDecrement: decrementWalk,
                onTextChanged: onWalkTextChanged,
              ),
              SizedBox(height: 20),
              DaySelector(
                selectedDays: selectedDays,
                onChanged: (days) {
                  setState(() {
                    selectedDays = days;
                  });
                },
              ),
              SizedBox(height: 5),
              TimePicker(
                startAt: startAt,
                endAt: endAt,
                onStartTimeChanged: (time) {
                  setState(() {
                    startAt = time;
                  });
                },
                onEndTimeChanged: (time) {
                  setState(() {
                    endAt = time;
                  });
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save, size: 20, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  label: Text(
                    "Save Reminder",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.trim().isEmpty) {
                      setState(() => isNameInvalid = true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Enter a Name")),
                      );
                      return;
                    }
                    final newReminder = Reminder(
                      name: nameController.text.trim(),
                      color: selectedColor,
                      postureInterval: postureReminderInterval,
                      soundEnabled: tempIsSoundEnabled,
                      vibrationEnabled: tempIsVibrationEnabled,
                      walkReminderEnabled: tempIsWalkReminderEnabled,
                      walkInterval: walkReminderInterval,
                      days: selectedDays,
                      startAt: startAt,
                      endAt: endAt,
                    );
                    if (widget.index != null) {
                      ReminderManager.updateReminder(
                        widget.index!,
                        newReminder,
                      );
                    } else {
                      ReminderManager.addReminder(newReminder);
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
