import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  void addNote(NoteModel note) {
    try {
      var box = Hive.box<NoteModel>(kboxName);
      box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(e.toString()));
    }
  }
  void editNote(NoteModel note) async {
  try {
    await note.save(); 
    emit(AddNoteSuccess());
  } catch (e) {
    emit(AddNoteError(e.toString()));
  }
}

}
