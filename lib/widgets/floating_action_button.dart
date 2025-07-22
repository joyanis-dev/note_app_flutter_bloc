import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTextField(labelText: 'Note Title'),
          const SizedBox(height: 20),
          CustomTextField(maxLines: 5, labelText: 'Note Content'),
          const SizedBox(height: 80),
          CustomButton(
            onPressed: () {
              
              Navigator.pop(context); // Close the bottom sheet
            },
          ),
        ],
      ),
    );
  }
}
