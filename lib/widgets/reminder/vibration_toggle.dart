import 'package:flutter/material.dart';

class VibrationToggleRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const VibrationToggleRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text("Vibration"),
      value: value,
      onChanged: onChanged,
    );
  }
}
