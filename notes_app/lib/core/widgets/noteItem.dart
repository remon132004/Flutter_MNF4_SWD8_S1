import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              "Flutter Tips",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 25),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "build your career with Remon",
                style: TextStyle(color: AppColors.secondaryColor, fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: AppColors.primaryColor, size: 35),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "May21,2026",
              style: TextStyle(fontSize: 16, color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
