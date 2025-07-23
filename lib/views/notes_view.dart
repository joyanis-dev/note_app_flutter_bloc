import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/floating_action_button.dart';
import 'package:notes_app/widgets/notes_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: Scaffold(
        floatingActionButton: AddNoteFAB(),
        appBar: CustomAppBar(
          title: 'Notes',
          actions: [CustomIconButton(icon: Icons.search)],
        ),
        body: NotesBody(),
      ),
    );
  }
}
