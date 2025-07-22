import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_constants.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.labelText,
    this.onSaved,
    
  });
  final int maxLines;
  final String labelText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: kPrimaryColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
