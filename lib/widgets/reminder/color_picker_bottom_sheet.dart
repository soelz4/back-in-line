import 'package:flutter/material.dart';

class ColorPickerCircle extends StatelessWidget {
  final Color selectedColor;
  final List<Color> availableColors;
  final Function(Color) onColorSelected;

  const ColorPickerCircle({
    super.key,
    required this.selectedColor,
    required this.availableColors,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder:
              (_) => ColorPickerBottomSheet(
                colors: availableColors,
                selectedColor: selectedColor,
                onColorSelected: onColorSelected,
              ),
        );
      },
      child: CircleAvatar(
        radius: 40,
        backgroundColor: selectedColor,
        child: Icon(Icons.color_lens, color: Colors.white, size: 34),
      ),
    );
  }
}

class ColorPickerBottomSheet extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const ColorPickerBottomSheet({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Choose a Color",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children:
                colors.map((color) {
                  final isSelected = color == selectedColor;
                  return GestureDetector(
                    onTap: () {
                      onColorSelected(color);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                        border:
                            isSelected
                                ? Border.all(color: Colors.black, width: 3)
                                : null,
                      ),
                      width: 40,
                      height: 40,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
