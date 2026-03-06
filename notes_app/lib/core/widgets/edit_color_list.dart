import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/note/data/models/note_model.dart';
import '../../features/note/presentation/cubit/add_note_cubit/add_note_cubit.dart';
import '../constants/app_colors.dart';
import 'color_item.dart';

class EditColorList extends StatefulWidget {
  final NoteModel note;

  const EditColorList({super.key, required this.note});

  @override
  State<EditColorList> createState() => _EditColorListState();
}

class _EditColorListState extends State<EditColorList> {
  late int currentIndex = 0;
@override
  void initState() {
    currentIndex=AppColors.noteColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.note.color=AppColors.noteColors[index].value;
                });
              },
              child: ColorItem(
                color: AppColors.noteColors[index],
                isPicker: currentIndex == index,
              ),
            ),
          );
        },
        itemCount: AppColors.noteColors.length,
      ),
    );
  }
}
