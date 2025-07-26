import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/common/custom_appbar.dart';
import 'package:notes_app/widgets/common/custom_icon.dart';
import 'package:notes_app/widgets/search/search_body.dart';

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
      appBar: CustomAppBar(
        title: 'Search Notes',
        actions: [
          CustomIconButton(
            icon: Icons.close,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SearchBody(lastQuery: _lastQuery,
      controller: _controller,
      onChanged:_onSearchChanged,
      ),
    );
  }
}

