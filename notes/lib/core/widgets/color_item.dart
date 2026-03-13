import 'package:flutter/material.dart';
import 'package:notes/core/constants/app_colors.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isPicker;

  const ColorItem({super.key, required this.color, required this.isPicker});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.white : Color(0xff7A7777FF);
    return isPicker
        ? Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:borderColor,
      ),
            child: CircleAvatar(radius: 35, backgroundColor: color),
          )
        : CircleAvatar(radius: 35, backgroundColor: color);
  }
}
