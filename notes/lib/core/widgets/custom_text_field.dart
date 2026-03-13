import 'package:flutter/material.dart';
import 'package:notes/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.initialValue,
    this.controller,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : AppColors.primaryColor;

    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        return null;
      },
      initialValue: initialValue,
      controller: controller,
      onSaved: onSaved,
      cursorColor: textColor,
      maxLines: maxLines,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
        border: buildBorder(color: textColor),
        enabledBorder: buildBorder(color: textColor),
        focusedBorder: buildBorder(color: AppColors.noteTextColor!),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) => OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(10),
  );
}