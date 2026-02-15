import 'package:flutter/material.dart';
import 'package:notes_app/core/widgets/custom_appBar.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

import '../constants/app_strings.dart';
import '../widgets/edit_note_body.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        icon: Icons.check,
        implyLeading: true,
      ),
      body: EditNoteBody(),
    );
  }
}

