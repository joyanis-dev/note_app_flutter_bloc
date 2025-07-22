import 'package:flutter/material.dart';
import 'package:notes_app/constants/app_textstyles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 10,
        bottom: 20,
      ),
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffFFCC80),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
         
          children: [
             ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text('Note Title', style: AppTextStyles.heading),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Note content goes here',
                  style: AppTextStyles.bodyText,
                ),
              ),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete, color: Colors.black, size: 30),
                onPressed: () {
                 
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text('2/2/2020', style: AppTextStyles.dateText),
            ),
          ],
        ),
    );
  }
}