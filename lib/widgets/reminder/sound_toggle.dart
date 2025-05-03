import 'package:flutter/material.dart';

class SoundToggleRow extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SoundToggleRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text("Sound: Play a Short Tone Each Time"),
      value: value,
      onChanged: onChanged,
    );
  }
}
