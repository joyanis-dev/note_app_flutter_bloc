import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/floating_action_button.dart';
import 'package:notes_app/widgets/notes_body.dart';
import 'package:notes_app/widgets/setting_drawer.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddNoteFAB(),
      drawer: const SettingDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: CustomAppBar(
        title: 'Notes',
        actions: [
          CustomIconButton(icon: Icons.search),
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
    );
  }
}
