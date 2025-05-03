import 'package:flutter/material.dart';

class DaySelector extends StatelessWidget {
  final List<String> selectedDays;
  final ValueChanged<List<String>> onChanged;

  const DaySelector({
    super.key,
    required this.selectedDays,
    required this.onChanged,
  });

  static const List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children:
          daysOfWeek.map((day) {
            final isSelected = selectedDays.contains(day);
            return ChoiceChip(
              label: Text(day),
              selected: isSelected,
              onSelected: (selected) {
                final updatedDays = [...selectedDays];
                if (selected) {
                  updatedDays.add(day);
                } else {
                  updatedDays.remove(day);
                }
                onChanged(updatedDays);
              },
            );
          }).toList(),
    );
  }
}
