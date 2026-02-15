import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.noteTextColor,
        ),
        child: Center(
          child: Text("Add", style: TextStyle(fontSize:18,fontWeight: FontWeight.w400,color: AppColors.primaryColor)),
        ),
      ),
    );
  }
}
