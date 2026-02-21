import 'package:flutter/material.dart';
import 'package:notes_app/core/routing/routes.dart';

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
        return MaterialPageRoute(
          builder: (context) {
            return EditNoteScreen();
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
