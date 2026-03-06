import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/note/data/models/note_model.dart';
import 'package:notes_app/features/note/data/repo/NotesRepo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.repo) : super(NotesInitial());
  final NotesRepo repo;

  void getNotes() {
    emit(NotesLoading());
    try {
      final notes = repo.getNotes();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }

  // Future<void> deleteNote(int index) async {
  //   try {
  //     await repo.deleteNote(index);
  //     getNotes();
  //   } catch (e) {
  //     emit(NotesFailure(e.toString()));
  //   }
  // }
}
