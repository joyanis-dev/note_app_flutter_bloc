abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteError extends AddNoteState {
  final String error;

  AddNoteError(this.error);
}
