import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key , required this.icon,this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white.withValues( alpha: 0.2),
          borderRadius: BorderRadius.circular(13)
        ),
        child: IconButton(
          icon: Icon(icon, size: 25),
          onPressed: onPressed
        ),
      ),
    );
  }
}
