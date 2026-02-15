import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';
import 'package:notes_app/core/widgets/add_note_bottom_sheet.dart';

import '../core/widgets/custom_appBar.dart';
import '../core/widgets/notes_view_body.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notes", icon: Icons.search),
      body: NotesViewBody(),
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
              return AddNoteBotomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
