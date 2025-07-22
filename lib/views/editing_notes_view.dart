import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/editing_body.dart';

class EditingNotesView extends StatelessWidget {
  const EditingNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        actions: [CustomIconButton(icon: Icons.check)],
      ),
      body: EditingBody(),
    );
  }
}

