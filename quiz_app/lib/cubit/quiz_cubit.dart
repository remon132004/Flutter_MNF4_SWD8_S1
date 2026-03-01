import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/question.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizInitial());

  void startQuiz() {
    emit(QuizInProgress(
      questions: sampleQuestions,
      currentIndex: 0,
      answers: {},
    ));
  }

  void selectOption(int optionIndex) {
    final current = state;
    if (current is QuizInProgress) {
      emit(current.copyWith(selectedOption: optionIndex));
    }
  }

  void nextQuestion() {
    final current = state;
    if (current is! QuizInProgress) return;

    final updatedAnswers = Map<String, int>.from(current.answers);
    if (current.selectedOption != null) {
      updatedAnswers[current.currentQuestion.id] = current.selectedOption!;
    }

    if (current.isLastQuestion) {
      emit(QuizCompleted(
        questions: current.questions,
        answers: updatedAnswers,
      ));
    } else {
      emit(current.copyWith(
        currentIndex: current.currentIndex + 1,
        answers: updatedAnswers,
        clearSelected: true,
      ));
    }
  }

  void skipQuestion() {
    final current = state;
    if (current is! QuizInProgress) return;

    if (current.isLastQuestion) {
      emit(QuizCompleted(
        questions: current.questions,
        answers: current.answers,
      ));
    } else {
      emit(current.copyWith(
        currentIndex: current.currentIndex + 1,
        clearSelected: true,
      ));
    }
  }

  void restartQuiz() {
    emit(const QuizInitial());
  }

  void backToHome() {
    emit(const QuizInitial());
  }
}
