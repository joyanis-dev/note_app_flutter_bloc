import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/app_textstyles.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/editing_notes_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor.withValues(alpha: 0.8);

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditingNotesView(note: widget.note),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.only(
            left: 20,
            right: 10,
            top: 10,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(widget.note.color),
            boxShadow: isPressed
                ? [
                    BoxShadow(
                      color: themeColor,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.note.title, style: AppTextStyles.heading),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child:
                      Text(widget.note.content, style: AppTextStyles.bodyText),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  icon:
                      const Icon(Icons.delete, color: Colors.black, size: 30),
                  onPressed: () {
                    widget.note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                   highlightColor: Theme.of(context).primaryColor.withValues(alpha: 0.4),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(widget.note.date, style: AppTextStyles.dateText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
