import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/widgets/custom_appBar.dart';
import 'package:notes/core/widgets/edit_color_list.dart';
import '../../data/models/note_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubit/edit_note_cubit/edit_note_cubit.dart';
import '../cubit/notes_cubit/notes_cubit.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title;
  String? subtitle;
  int? color;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Note',
        icon: Icons.check,
        implyLeading: true,
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = subtitle ?? widget.note.subtitle;
            widget.note.date = DateTime.now();
            widget.note.save();
            context.read<NotesCubit>().getNotes();
            Navigator.pop(context);
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                CustomTextField(
                  hint: AppStrings.title,
                  initialValue: widget.note.title,
                  onSaved: (value) {
                    title = value;
                  },
                ),
                SizedBox(height: 30),
                CustomTextField(
                  initialValue: widget.note.subtitle,
                  hint: AppStrings.content,
                  maxLines: 8,
                  onSaved: (value) {
                    subtitle = value;
                  },
                ),
                const SizedBox(height: 30),
                EditColorList(note: widget.note),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
