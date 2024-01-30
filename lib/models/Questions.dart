class Question {
  final int? id, answer;
  String question;
  final List<String>? options;

  Question({this.id, required this.question, this.answer, this.options});
}

const String teamName = 'このチームは？';

const List questionData = [
  {
    "id": 1,
    "question":
        teamName,
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": teamName,
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": teamName,
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": teamName,
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];