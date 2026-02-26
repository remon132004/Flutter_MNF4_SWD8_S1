import 'package:flutter/material.dart';

import '../../features/note/data/models/note_model.dart';
import '../routing/routes.dart';
import 'noteItem.dart';

class NotesViewBody extends StatelessWidget {
  final List<NoteModel> notes;

  const NotesViewBody({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: NoteItem(index: index, note: notes[index]),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.editScreen, arguments: {
                      'note': notes[index],
                      'index': index,
                    },);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
