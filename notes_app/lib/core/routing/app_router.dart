import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/routing/routes.dart';
import 'package:notes_app/features/note/data/models/note_model.dart';
import 'package:notes_app/features/note/presentation/cubit/edit_note_cubit/edit_note_cubit.dart';

import '../../features/note/data/repo/NotesRepo.dart';
import '../../features/note/presentation/screens/edit_note_screen.dart';
import '../../features/note/presentation/screens/note_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      case AppRoutes.editScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final note = args['note'] as NoteModel;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => EditNoteCubit(NotesRepo()),
              child: EditNoteScreen(note: note,),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Center(child: Text("No Route Defined ")));
          },
        );
    }
  }
}
