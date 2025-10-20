import 'package:flutter/material.dart';

@immutable
class QuestionPreview {
  const QuestionPreview({
    required this.id,
    required this.year,
    required this.track,
    required this.subject,
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.explanation,
    required this.youtubeVideoId,
    required this.tags,
    required this.correctRate,
    required this.isBookmarked,
    required this.isSolved,
  });

  final String id;
  final int year;
  final String track;
  final String subject;
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explanation;
  final String youtubeVideoId;
  final List<String> tags;
  final double correctRate;
  final bool isBookmarked;
  final bool isSolved;

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$youtubeVideoId';

  String get difficultyLabel {
    if (correctRate >= 0.75) {
      return '난이도: 쉬움';
    }
    if (correctRate >= 0.55) {
      return '난이도: 중간';
    }
    return '난이도: 어려움';
  }

  String get completionLabel => isSolved ? '풀이 완료' : '풀이 예정';
}
