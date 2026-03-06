import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isPicker;

  const ColorItem({super.key, required this.color, required this.isPicker});

  @override
  Widget build(BuildContext context) {
    return isPicker
        ? Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
            child: CircleAvatar(radius: 35, backgroundColor: color),
          )
        : CircleAvatar(radius: 35, backgroundColor: color);
  }
}
