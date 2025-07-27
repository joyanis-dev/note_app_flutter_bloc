import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      splashColor: Theme.of(context).primaryColor.withValues(alpha: 0.8),
      iconColor: kPrimaryColor,
    );
  }
}
