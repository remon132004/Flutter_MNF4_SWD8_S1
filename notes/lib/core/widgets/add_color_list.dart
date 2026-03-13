import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/note/presentation/cubit/add_note_cubit/add_note_cubit.dart';
import '../constants/app_colors.dart';
import 'color_item.dart';

class AddColorList extends StatefulWidget {
  const AddColorList({super.key});

  @override
  State<AddColorList> createState() => _AddColorListState();
}

class _AddColorListState extends State<AddColorList> {
  int currentIndex = 0;

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
                  context.read<AddNoteCubit>().color =
                  AppColors.noteColors[index];
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
