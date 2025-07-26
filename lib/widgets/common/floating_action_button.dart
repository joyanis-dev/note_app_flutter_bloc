import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/note/add_note_bottom_sheet.dart';

class AddNoteFAB extends StatelessWidget {
  const AddNoteFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        final addNoteCubit = BlocProvider.of<AddNoteCubit>(context);

        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BlocProvider.value(
              value: addNoteCubit,
              child: AddNoteBottomSheet(),
            );
          },
        );
      },

      child: const Icon(Icons.add),
    );
  }
}
