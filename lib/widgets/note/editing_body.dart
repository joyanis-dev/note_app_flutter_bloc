import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/common/custom_text_field.dart';
import 'package:notes_app/widgets/note/note_color_picker.dart';


class EditingBody extends StatefulWidget {
  const EditingBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditingBody> createState() => _EditingBodyState();
}

class _EditingBodyState extends State<EditingBody> {
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = Color(widget.note.color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            labelText: 'Title',
            initialValue: widget.note.title,
            onChanged: (value) {
              widget.note.title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Content',
            maxLines: 5,
            initialValue: widget.note.content,
            onChanged: (value) {
              widget.note.content = value;
            },
          ),
          const SizedBox(height: 40),
          const Text(
            'Select Color',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          NoteColorPicker(
            colors: noteColors,
            selectedColor: selectedColor,
            onColorSelected: (color) {
              setState(() {
                selectedColor = color;
                widget.note.color = color.toARGB32();
              });
            },
          ),
        ],
      ),
    );
  }
}
