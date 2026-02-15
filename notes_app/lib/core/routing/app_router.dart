import 'package:flutter/material.dart';
import 'package:notes_app/core/routing/routes.dart';

import '../../views/edit_note_view.dart';
import '../../views/note_view.dart';



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
