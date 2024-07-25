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
    "question": teamName,
    "options": ['トッテナム', 'マンチェスターU', 'チェルシー'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": teamName,
    "options": ['レアル・マドリード', 'バルセロナ', 'セビージャ'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": teamName,
    "options": ['インテル', 'ACミラン', 'ユヴェントス'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": teamName,
    "options": ['バイエルン', 'ドルトムント', 'レヴァークーゼン'],
    "answer_index": 2,
  },
];
