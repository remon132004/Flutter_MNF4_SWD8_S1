import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/quiz_cubit.dart';
import 'cubit/quiz_state.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/results_screen.dart';
import 'widgets/app_theme.dart';

void main() {
  runApp(const QuizMasterApp());
}

class QuizMasterApp extends StatelessWidget {
  const QuizMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(),
      child: MaterialApp(
        title: 'QuizMaster',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const QuizNavigator(),
      ),
    );
  }
}

class QuizNavigator extends StatelessWidget {
  const QuizNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: switch (state) {
            QuizInitial() => const HomeScreen(key: ValueKey('home')),
            QuizInProgress() => const QuizScreen(key: ValueKey('quiz')),
            QuizCompleted() => const ResultsScreen(key: ValueKey('results')),
            _ => const HomeScreen(key: ValueKey('home')),
          },
        );
      },
    );
  }
}
