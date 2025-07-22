import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditingBody extends StatelessWidget {
  const EditingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(labelText: 'Title'),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
