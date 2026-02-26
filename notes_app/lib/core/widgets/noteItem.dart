import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/note/presentation/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/core/constants/extensions.dart';
import '../../features/note/data/models/note_model.dart';
import '../constants/app_colors.dart';
import '../constants/extensions.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  final int index;

  const NoteItem({super.key, required this.index, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 25),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                note.subtitle,
                style: TextStyle(color: AppColors.secondaryColor, fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                context.read<NotesCubit>().deleteNote(index);
              },
              icon: Icon(Icons.delete, color: AppColors.primaryColor, size: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              note.date.toUiDate(),
              style: TextStyle(fontSize: 16, color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
