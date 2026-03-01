class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String category;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.category,
  });
}

final List<Question> sampleQuestions = [
  Question(
    id: '1',
    text: 'Which planet is the largest in our solar system?',
    options: ['Mars', 'Jupiter', 'Saturn', 'Neptune'],
    correctIndex: 1,
    category: 'Science',
  ),
  Question(
    id: '2',
    text: 'What is the capital of France?',
    options: ['London', 'Berlin', 'Paris', 'Madrid'],
    correctIndex: 2,
    category: 'Geography',
  ),
  Question(
    id: '3',
    text: 'Who painted the Mona Lisa?',
    options: ['Van Gogh', 'Picasso', 'Michelangelo', 'Leonardo da Vinci'],
    correctIndex: 3,
    category: 'Art',
  ),
  Question(
    id: '4',
    text: 'What is the chemical symbol for gold?',
    options: ['Go', 'Gd', 'Au', 'Ag'],
    correctIndex: 2,
    category: 'Science',
  ),
  Question(
    id: '5',
    text: 'How many continents are there on Earth?',
    options: ['5', '6', '7', '8'],
    correctIndex: 2,
    category: 'Geography',
  ),
  Question(
    id: '6',
    text: 'What is the fastest land animal?',
    options: ['Lion', 'Cheetah', 'Leopard', 'Horse'],
    correctIndex: 1,
    category: 'Nature',
  ),
  Question(
    id: '7',
    text: 'In which year did World War II end?',
    options: ['1943', '1944', '1945', '1946'],
    correctIndex: 2,
    category: 'History',
  ),
  Question(
    id: '8',
    text: 'What is the largest ocean on Earth?',
    options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
    correctIndex: 3,
    category: 'Geography',
  ),
  Question(
    id: '9',
    text: 'How many sides does a hexagon have?',
    options: ['5', '6', '7', '8'],
    correctIndex: 1,
    category: 'Math',
  ),
  Question(
    id: '10',
    text: 'What is the hardest natural substance on Earth?',
    options: ['Gold', 'Iron', 'Diamond', 'Quartz'],
    correctIndex: 2,
    category: 'Science',
  ),
];
