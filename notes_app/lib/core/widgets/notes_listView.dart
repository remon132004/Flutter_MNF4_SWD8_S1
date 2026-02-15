import 'package:flutter/material.dart';
import '../routing/routes.dart';

import 'noteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: NoteItem(),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.editScreen);
            },
          );
        },
      ),
    );
  }
}
