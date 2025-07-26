import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/assets.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/widgets/empty_notes_body.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          final notes = state.notes;
          if (notes.isEmpty) {
            return const EmptyNotesWidget(
              imagePath: Assets.assetsUndraw,
              message: 'Create Your First Note!',
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return NoteItem(note: note);
              },
            ),
          );
        }  else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
