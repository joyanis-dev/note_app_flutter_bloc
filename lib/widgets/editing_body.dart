import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditingBody extends StatelessWidget {
  const EditingBody({
    super.key,
    required this.note
  });
   final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(labelText: note.title),
          const SizedBox(height: 20),
          CustomTextField(labelText: note.content, maxLines: 5),
        ],
      ),
    );
  }
}
