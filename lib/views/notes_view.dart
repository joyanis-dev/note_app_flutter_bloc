import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/floating_action_button.dart';
import 'package:notes_app/widgets/notes_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddNoteFAB(),
      appBar: AppBar(
        title: const Text('Notes'),
        toolbarHeight: 70,
        actions: [CustomIconButton()],
      ),
      body: NotesBody(),
    );
  }
}


