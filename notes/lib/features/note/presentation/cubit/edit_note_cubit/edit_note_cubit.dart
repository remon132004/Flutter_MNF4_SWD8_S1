import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/features/note/data/models/note_model.dart';
import 'package:notes/features/note/data/repo/NotesRepo.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  final NotesRepo repo;

  EditNoteCubit(this.repo) : super(EditNoteInitial());

  Future<void> editNote(int index, NoteModel note) async {
    emit(EditNoteLoading());
    try {
      await repo.editNote(index, note);
      emit(EditNoteSuccess());
    } catch (e) {
      emit(EditNoteFailure(e.toString()));
    }
  }
}
