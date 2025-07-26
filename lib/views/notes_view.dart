import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/search_view.dart';
import 'package:notes_app/widgets/common/custom_appbar.dart';
import 'package:notes_app/widgets/common/custom_icon.dart';
import 'package:notes_app/widgets/common/floating_action_button.dart';
import 'package:notes_app/widgets/note/notes_body.dart';
import 'package:notes_app/widgets/setting/setting_drawer.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        floatingActionButton: AddNoteFAB(),
        drawer: const SettingDrawer(),
        drawerEnableOpenDragGesture: false,
        appBar: CustomAppBar(
          title: 'Notes',
          actions: [
            CustomIconButton(
              icon: Icons.search,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
            Builder(
              builder: (context) => CustomIconButton(
                icon: Icons.settings,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ],
        ),
        body: NotesBody(),
      ),
    );
  }
}
