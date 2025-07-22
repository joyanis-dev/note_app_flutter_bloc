import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues( alpha: 0.2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Add your action here
          },
        ),
      ),
    );
  }
}
