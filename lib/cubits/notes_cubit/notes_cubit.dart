import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  void fetchAllNotes() {
    final box = Hive.box<NoteModel>(kboxName);
    emit(NotesSuccess(box.values.toList()));
  }
}
