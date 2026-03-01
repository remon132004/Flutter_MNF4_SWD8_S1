import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';
import '../widgets/app_theme.dart';
import '../widgets/common_widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is! QuizCompleted) return const SizedBox.shrink();

        final isExcellent = state.score >= state.total * 0.8;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Quiz Results'),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Badge Icon
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Icon(
                    isExcellent ? Icons.emoji_events : Icons.star_outline,
                    color: AppColors.primary,
                    size: 44,
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  isExcellent ? 'Congratulations!' : 'Good Effort!',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isExcellent
                      ? "You've mastered this quiz!"
                      : 'Keep practicing to improve!',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 28),

                // Score Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Your Score',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${state.score}',
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            ' / ${state.total}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Score progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: state.score / state.total,
                          minHeight: 8,
                          backgroundColor: AppColors.border,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isExcellent
                                ? AppColors.success
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        isExcellent
                            ? 'Great job! You\'re almost perfect!'
                            : 'You answered ${state.score} out of ${state.total} correctly.',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Buttons
                PrimaryButton(
                  label: 'Play Again',
                  icon: Icons.refresh,
                  onPressed: () => context.read<QuizCubit>().restartQuiz(),
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  label: 'Back to Home',
                  icon: Icons.home_outlined,
                  isOutlined: true,
                  onPressed: () => context.read<QuizCubit>().backToHome(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
