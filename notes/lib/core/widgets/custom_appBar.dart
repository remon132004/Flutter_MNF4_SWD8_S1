
import 'package:day_night_themed_switcher/day_night_themed_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/constants/app_colors.dart';
import '../../features/note/presentation/cubit/ThemeCubit/theme_cubit.dart';

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
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Transform.scale(
            scale: 0.7,
            child: BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDarkTheme) {
                return DayNightSwitch(
                  initiallyDark: isDarkTheme,
                  duration: const Duration(milliseconds: 800),
                  onChange: (dark) => context.read<ThemeCubit>().toggleTheme(dark),
                );
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.noteTextColor,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              icon,
              size: 24,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}