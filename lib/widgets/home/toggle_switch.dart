import "package:flutter/material.dart";

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key, required this.isOn, required this.onChanged});

  final bool isOn;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => onChanged(!isOn),
      child: Container(
        width: 180,
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isOn ? Colors.teal : theme.disabledColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 220),
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 80,
                height: 90,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    isOn ? "ON" : "OFF",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isOn ? Colors.teal : theme.disabledColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
