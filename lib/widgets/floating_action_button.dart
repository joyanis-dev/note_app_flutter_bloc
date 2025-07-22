import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';

class AddNoteFAB extends StatelessWidget {
  const AddNoteFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return AddNoteBottomSheet();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

