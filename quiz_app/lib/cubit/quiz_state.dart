import 'package:equatable/equatable.dart';
import '../models/question.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class QuizInProgress extends QuizState {
  final List<Question> questions;
  final int currentIndex;
  final Map<String, int> answers; // questionId -> selectedOptionIndex
  final int? selectedOption; // currently selected option (not yet confirmed)

  const QuizInProgress({
    required this.questions,
    required this.currentIndex,
    required this.answers,
    this.selectedOption,
  });

  double get progress => (currentIndex + 1) / questions.length;
  int get totalQuestions => questions.length;
  Question get currentQuestion => questions[currentIndex];
  bool get isLastQuestion => currentIndex == questions.length - 1;

  QuizInProgress copyWith({
    int? currentIndex,
    Map<String, int>? answers,
    int? selectedOption,
    bool clearSelected = false,
  }) {
    return QuizInProgress(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      selectedOption: clearSelected ? null : selectedOption ?? this.selectedOption,
    );
  }

  @override
  List<Object?> get props => [questions, currentIndex, answers, selectedOption];
}

class QuizCompleted extends QuizState {
  final List<Question> questions;
  final Map<String, int> answers;

  const QuizCompleted({
    required this.questions,
    required this.answers,
  });

  int get score {
    int count = 0;
    for (final q in questions) {
      if (answers[q.id] == q.correctIndex) count++;
    }
    return count;
  }

  int get total => questions.length;

  @override
  List<Object?> get props => [questions, answers];
}
