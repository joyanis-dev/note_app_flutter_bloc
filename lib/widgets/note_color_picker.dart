import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item_color';


class NoteColorPicker extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const NoteColorPicker({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: NoteItemColor(
              color: color,
              isSelected: color == selectedColor,
              onTap: () => onColorSelected(color),
            ),
          );
        },
      ),
    );
  }
}
