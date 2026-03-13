import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/core/constants/app_strings.dart';
import 'package:notes/features/note/data/models/note_model.dart';
import 'package:notes/features/note/data/repo/NotesRepo.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this.repo) : super(AddNoteInitial());
  final NotesRepo repo;

  Color color=Color(0xFF53EDD8);
  void addNote(NoteModel note) async {
    note.color=color.value;
    emit(AddNoteLoading());
    try {
      await repo.addNote(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
