import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(children: [NoteItem()]),
    );
  }
}
