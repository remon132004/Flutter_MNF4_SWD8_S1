import 'package:flutter/material.dart';

import 'notes_listView.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotesListView(),
        ),
      ],
    );
  }
}


