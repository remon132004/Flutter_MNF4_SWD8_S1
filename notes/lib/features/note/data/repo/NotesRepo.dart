import 'package:hive_flutter/adapters.dart';
import 'package:notes/features/note/data/models/note_model.dart';

import '../../../../core/constants/app_strings.dart';

class NotesRepo {
  final Box<NoteModel> notesBox = Hive.box<NoteModel>(AppStrings.notesBox);

  Future<void> addNote(NoteModel note) async {
    await notesBox.add(note);
  }

  List<NoteModel> getNotes() {
    return notesBox.values.toList();
  }

  Future<void> deleteNote(int index) async {
    await notesBox.deleteAt(index);
  }

  Future<void> deleteAllNotes() async {
    await notesBox.clear();
  }

  Future<void> editNote(int index, NoteModel note) async {
    await notesBox.putAt(index, note);
  }
}
