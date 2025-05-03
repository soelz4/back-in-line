import 'package:flutter/material.dart';

class Reminder {
  final String name;
  final Color color;
  final int postureInterval;
  final bool soundEnabled;
  final bool vibrationEnabled;
  final bool walkReminderEnabled;
  final int walkInterval;
  final List<String> days;
  final TimeOfDay startAt;
  final TimeOfDay endAt;

  Reminder({
    required this.name,
    required this.color,
    required this.postureInterval,
    required this.soundEnabled,
    required this.vibrationEnabled,
    required this.walkReminderEnabled,
    required this.walkInterval,
    required this.days,
    required this.startAt,
    required this.endAt,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'color': color.toARGB32(), // Store as int
    'postureInterval': postureInterval,
    'soundEnabled': soundEnabled,
    'vibrationEnabled': vibrationEnabled,
    'walkReminderEnabled': walkReminderEnabled,
    'walkInterval': walkInterval,
    'days': days,
    'startAt': {'hour': startAt.hour, 'minute': startAt.minute},
    'endAt': {'hour': endAt.hour, 'minute': endAt.minute},
  };

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    name: json['name'] ?? '',
    color: Color(json['color'] ?? Colors.blue.toARGB32()),
    postureInterval: json['postureInterval'] ?? 1,
    soundEnabled: json['soundEnabled'] ?? true,
    vibrationEnabled: json['vibrationEnabled'] ?? false,
    walkReminderEnabled: json['walkReminderEnabled'] ?? false,
    walkInterval: json['walkInterval'] ?? 1,
    days: List<String>.from(json['days'] ?? []),
    startAt: TimeOfDay(
      hour: json['startAt']?['hour'] ?? 9,
      minute: json['startAt']?['minute'] ?? 0,
    ),
    endAt: TimeOfDay(
      hour: json['endAt']?['hour'] ?? 21,
      minute: json['endAt']?['minute'] ?? 0,
    ),
  );
}
