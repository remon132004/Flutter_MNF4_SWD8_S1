import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/widgets/custom_appBar.dart';
import 'package:notes_app/features/note/data/models/note_model.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubit/edit_note_cubit/edit_note_cubit.dart';
import '../cubit/notes_cubit/notes_cubit.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.note, required this.index});

  final NoteModel note;
  final int index;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditNoteCubit, EditNoteState>(
      listener: (context, state) {
        if (state is EditNoteSuccess) {
          context.read<NotesCubit>().getNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            implyLeading: true,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                final updated = NoteModel(
                  title: title ?? widget.note.title,
                  subtitle: subtitle ?? widget.note.subtitle,
                  date: widget.note.date,
                  color: widget.note.color,
                );
                context.read<EditNoteCubit>().editNote(widget.index, updated);
              }
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    hint: AppStrings.title,
                    initialValue: widget.note.title,
                    onSaved: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    initialValue: widget.note.subtitle,
                    hint: AppStrings.content,
                    maxLines: 5,
                    onSaved: (value) {
                      subtitle = value;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
