import 'package:flutter/material.dart';


class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({
    super.key,
   required this.imagePath,
    required this.message,
  });

  final String imagePath; 
  final String message; 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 5),
           Text(
           message,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
