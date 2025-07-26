import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/assets.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/search/custom_search_textfield.dart';
import 'package:notes_app/widgets/note/empty_notes_body.dart';
import 'package:notes_app/widgets/note/note_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
    required String lastQuery,
    required this.controller,
    required this.onChanged
  }) : _lastQuery = lastQuery;

  final String _lastQuery;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomSearchField(
            onChanged: onChanged,
            controller:controller ,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state is NotesSuccess) {
                  final List<NoteModel> notes = state.notes;
    
                  if (_lastQuery.trim().isNotEmpty && notes.isEmpty) {
                    return const Center(
                      child: EmptyNotesWidget(
                        imagePath: Assets.assetsCuate,
                        message: 'File not found Try searching again.',
                      ),
                    );
                  }
    
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return NoteItem(note: notes[index]);
                    },
                  );
                }
    
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
