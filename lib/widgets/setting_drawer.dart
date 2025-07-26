import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/theme_cubit/theme_cubit.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().isDark;
    return Drawer(
      backgroundColor: isDark ? Colors.black : Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Text(
              'Settings',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Change Theme'),
            onTap: () {
              Navigator.of(context).pop();
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
