import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/note_color_picker.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? content;

  Color selectedColor = noteColors[0];

  void onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
      },
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextField(
                  labelText: 'Note Title',
                  onSaved: (value) => title = value,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  maxLines: 5,
                  labelText: 'Note Content',
                  onSaved: (value) => content = value,
                ),
                const SizedBox(height: 40),
                NoteColorPicker(
                  colors: noteColors,
                  selectedColor: selectedColor,
                  onColorSelected: onColorSelected,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final note = NoteModel(
                        title: title!,
                        content: content!,
                        date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        color: selectedColor.toARGB32(),
                      );

                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
