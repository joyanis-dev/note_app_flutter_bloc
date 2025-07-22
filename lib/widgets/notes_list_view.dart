import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: ListView.builder(
        itemCount: 10, // Replace with your dynamic note count
        itemBuilder: (context, index) {
          return const NoteItem();
        },
      ),
    );
  }
}
