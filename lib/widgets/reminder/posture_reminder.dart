import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostureReminderRow extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isInvalid;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final void Function(String) onTextChanged;

  const PostureReminderRow({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isInvalid,
    required this.onIncrement,
    required this.onDecrement,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Show Posture Reminder Every"),
        GestureDetector(
          onTap: onDecrement,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Icon(Icons.remove),
          ),
        ),
        SizedBox(
          width: 35,
          height: 35,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isInvalid ? Colors.red : Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isInvalid ? Colors.red : Colors.blue,
                ),
              ),
            ),
            onChanged: onTextChanged,
            onTap:
                () =>
                    controller.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: controller.text.length,
                    ),
          ),
        ),
        GestureDetector(
          onTap: onIncrement,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Icon(Icons.add),
          ),
        ),
        const Text("Minutes"),
      ],
    );
  }
}
