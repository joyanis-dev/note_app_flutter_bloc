import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_states.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/custom_search_textfield.dart';
import 'package:notes_app/widgets/note_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _lastQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _lastQuery = query;
    });

    if (query.trim().isEmpty) {
      // لو البحث فاضي، نرجّع كل الملاحظات
      context.read<NotesCubit>().fetchAllNotes();
    } else {
      context.read<NotesCubit>().searchNotes(query);
    }
  }

  @override
  void initState() {
    super.initState();
    // تحميل الملاحظات في الأول
    context.read<NotesCubit>().fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: CustomAppBar(title: 'Search Notes',
      actions: [
        CustomIconButton(icon: Icons.close,
        onPressed: () {
       Navigator.pop(context);
        },
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchField(onChanged:_onSearchChanged,
            controller: _controller,
             ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<NotesCubit, NotesState>(
                builder: (context, state) {
                  if (state is NotesSuccess) {
                    final List<NoteModel> notes = state.notes;

                    if (_lastQuery.trim().isNotEmpty && notes.isEmpty) {
                      return const Center(child: Text('No Notes Found'));
                    }

                    return ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return NoteItem(note: notes[index]);
                      },
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
