import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.implyLeading = false,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final bool implyLeading;
  final void Function()? onTap;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      title: Text(title),
      actions: [
        Container(
          margin: EdgeInsetsGeometry.only(right: 20),
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff3d3d3d),
          ),
          child: GestureDetector(onTap: onTap, child: Icon(size: 28, icon)),
        ),
      ],
    );
  }
}
