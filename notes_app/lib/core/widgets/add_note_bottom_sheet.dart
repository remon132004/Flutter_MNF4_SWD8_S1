import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/constants/app_strings.dart';
import 'package:notes_app/core/widgets/add_color_list.dart';
import 'package:notes_app/core/widgets/color_item.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';
import 'package:notes_app/features/note/data/models/note_model.dart';
import 'package:notes_app/features/note/presentation/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/features/note/presentation/cubit/notes_cubit/notes_cubit.dart';

import '../routing/routes.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title;
  String? subtitle;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddNoteCubit>();
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          context.read<NotesCubit>().getNotes();
          Navigator.pop(context);
        }
        if (state is AddNoteFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errM)));
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomTextField(
                hint: AppStrings.title,
                onSaved: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: AppStrings.content,
                maxLines: 6,
                onSaved: (value) {
                  subtitle = value;
                },
              ),
              // SizedBox(height: 10),
              const SizedBox(height: 30),
              AddColorList(),
              SizedBox(height: 30),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    cubit.addNote(
                      NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: DateTime.now(),
                        color: 0xFF53EDD8,
                      ),
                    );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),

              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
