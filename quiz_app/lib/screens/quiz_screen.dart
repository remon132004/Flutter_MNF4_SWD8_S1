import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';
import '../widgets/app_theme.dart';
import '../widgets/common_widgets.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is! QuizInProgress) return const SizedBox.shrink();

        final question = state.currentQuestion;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: const Text('Quiz'),
            leading: BackButton(
              onPressed: () => context.read<QuizCubit>().backToHome(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress
                QuizProgressBar(
                  current: state.currentIndex + 1,
                  total: state.totalQuestions,
                ),
                const SizedBox(height: 28),

                // Question
                Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),

                // Options
                ...List.generate(
                  question.options.length,
                  (i) => OptionTile(
                    text: question.options[i],
                    isSelected: state.selectedOption == i,
                    onTap: () => context.read<QuizCubit>().selectOption(i),
                  ),
                ),

                const Spacer(),

                // Next button
                PrimaryButton(
                  label: state.isLastQuestion ? 'Finish' : 'Next',
                  icon: state.isLastQuestion ? Icons.check : Icons.arrow_forward,
                  onPressed: state.selectedOption != null
                      ? () => context.read<QuizCubit>().nextQuestion()
                      : null,
                ),
                const SizedBox(height: 12),

                // Skip
                Center(
                  child: TextButton(
                    onPressed: () => context.read<QuizCubit>().skipQuestion(),
                    child: const Text(
                      'Skip this question',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
