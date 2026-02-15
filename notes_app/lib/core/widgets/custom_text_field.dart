import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty??true) {
          return 'Field is required';
        }
        else{
          return null;
        }
      },
      onSaved: onSaved,
      cursorColor: AppColors.noteTextColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.noteTextColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: AppColors.noteTextColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) => OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white),
    borderRadius: BorderRadius.circular(10),
  );
}
