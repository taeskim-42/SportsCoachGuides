import 'package:flutter/material.dart';

enum FlashcardStatus { learning, review, scheduled }

@immutable
class FlashcardPreview {
  const FlashcardPreview({
    required this.id,
    required this.title,
    required this.prompt,
    required this.answer,
    required this.nextReviewLabel,
    required this.easeFactor,
    required this.intervalDays,
    required this.status,
  });

  final String id;
  final String title;
  final String prompt;
  final String answer;
  final String nextReviewLabel;
  final double easeFactor;
  final int intervalDays;
  final FlashcardStatus status;

  String get statusLabel => switch (status) {
        FlashcardStatus.learning => '학습 중',
        FlashcardStatus.review => '복습 진행',
        FlashcardStatus.scheduled => '예약됨',
      };
}
