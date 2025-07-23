import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/editing_body.dart';

class EditingNotesView extends StatefulWidget {
  const EditingNotesView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditingNotesView> createState() => _EditingNotesViewState();
}

class _EditingNotesViewState extends State<EditingNotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        actions: [
          CustomIconButton(
            icon: Icons.check,
            onPressed: () {
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: EditingBody(note: widget.note),
    );
  }
}
