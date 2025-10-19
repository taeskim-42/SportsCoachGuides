class Question {
  const Question({
    required this.id,
    required this.year,
    required this.track,
    required this.subject,
    required this.questionText,
    required this.options,
    required this.answer,
    required this.explanation,
    this.youtubeLink,
    this.tags = const [],
  });

  final String id;
  final int year;
  final String track;
  final String subject;
  final String questionText;
  final List<String> options;
  final String answer;
  final String explanation;
  final String? youtubeLink;
  final List<String> tags;
}
