import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/features/note/data/models/note_model.dart';
import 'package:notes_app/features/note/data/repo/NotesRepo.dart';
import 'package:notes_app/features/note/presentation/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/features/note/presentation/cubit/notes_cubit/notes_cubit.dart';

import '../../../../core/widgets/custom_appBar.dart';
import '../../../../core/widgets/notes_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notes", icon: Icons.search ,),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is NotesFailure) {
            return Center(child: Text(state.err));
          }
          if (state is NotesSuccess) {
            final notes = state.notes;
            if (notes.isEmpty) {
              return const Center(child: Text('No notes yet'));
            }
            return NotesViewBody(notes: notes);
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff53edd8),
        foregroundColor: AppColors.primaryColor,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => AddNoteCubit(NotesRepo()),
                child: AddNoteBottomSheet(),
              );
            },

          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
