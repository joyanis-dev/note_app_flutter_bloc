import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/app_constants.dart';
import 'package:notes_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:notes_app/widgets/setting/listtile_widget.dart';

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
          ListTileWidget(
            icon: Icons.color_lens,
            title: 'Change Theme',
            onTap: () {
             
              context.read<ThemeCubit>().toggleTheme();
            },
          ),

          ListTileWidget(
            icon: Icons.info,
            title: 'About App',
            onTap: () {},
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 20,
            indent: 16,
            endIndent: 16,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),

            child: Text(
              'Write what should not be forgotten.',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

