import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> allNotes = [];

  void fetchAllNotes() {
    final box = Hive.box<NoteModel>(kboxName);
    allNotes = box.values.toList();
    emit(NotesSuccess(box.values.toList()));
  }

  void searchNotes(String keyword) {
    if (keyword.trim().isEmpty) {
      emit(NotesSuccess(allNotes));
      return;
    }

    final results = allNotes
        .where(
          (note) =>
              note.title.toLowerCase().contains(keyword.toLowerCase()) ||
              note.content.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();

    emit(NotesSuccess(results));
  }
}
