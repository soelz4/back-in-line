import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final TimeOfDay startAt;
  final TimeOfDay endAt;
  final ValueChanged<TimeOfDay> onStartTimeChanged;
  final ValueChanged<TimeOfDay> onEndTimeChanged;

  const TimePicker({
    super.key,
    required this.startAt,
    required this.endAt,
    required this.onStartTimeChanged,
    required this.onEndTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          icon: Icon(Icons.access_time),
          label: Text("Start: ${startAt.format(context)}"),
          onPressed: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: startAt,
            );
            if (picked != null) {
              onStartTimeChanged(picked);
            }
          },
        ),
        TextButton.icon(
          icon: Icon(Icons.access_time_filled),
          label: Text("End: ${endAt.format(context)}"),
          onPressed: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: endAt,
            );
            if (picked != null) {
              onEndTimeChanged(picked);
            }
          },
        ),
      ],
    );
  }
}
