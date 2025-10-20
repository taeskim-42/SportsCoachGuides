import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/preview/widgets/section_header.dart';
import 'package:oli/1_application/preview/feature_preview_controller.dart';
import 'package:oli/1_application/preview/model/flashcard_preview.dart';

class FlashcardPreviewSection extends GetView<FeaturePreviewController> {
  const FlashcardPreviewSection({required this.header, super.key});

  final SectionHeader header;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final cards = controller.flashcards;
        return SingleChildScrollView(
          key: const ValueKey('flashcard-preview'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              _ScheduleSummary(cards: cards),
              const SizedBox(height: 20),
              if (cards.isNotEmpty)
                _FlashcardDetail(card: cards.first)
              else
                const _EmptyState(),
              const SizedBox(height: 20),
              _SpacedRepetitionNotes(),
            ],
          ),
        );
      },
    );
  }
}

class _ScheduleSummary extends StatelessWidget {
  const _ScheduleSummary({required this.cards});

  final List<FlashcardPreview> cards;

  @override
  Widget build(BuildContext context) {
    final today = cards.where((c) => c.status == FlashcardStatus.review).length;
    final upcoming = cards.where((c) => c.status == FlashcardStatus.scheduled).length;
    final learning = cards.where((c) => c.status == FlashcardStatus.learning).length;

    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('복습 일정 요약', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            Row(
              children: [
                _SummaryBadge(label: '오늘 복습', value: today),
                const SizedBox(width: 12),
                _SummaryBadge(label: '예정 카드', value: upcoming),
                const SizedBox(width: 12),
                _SummaryBadge(label: '학습 중', value: learning),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColorScheme.backgroundBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'SM-2 기반 반복 간격을 사용합니다. 복습 완료 후에는 Ease Factor, Interval, Next Review를 즉시 갱신하세요.',
                style: AppTextTheme.body3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FlashcardDetail extends StatelessWidget {
  const _FlashcardDetail({required this.card});

  final FlashcardPreview card;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(card.statusLabel),
                  backgroundColor: AppColorScheme.backgroundSky,
                ),
                const SizedBox(width: 12),
                Text(card.nextReviewLabel, style: AppTextTheme.body2),
              ],
            ),
            const SizedBox(height: 12),
            Text(card.title, style: AppTextTheme.h4),
            const SizedBox(height: 8),
            Text(card.prompt, style: AppTextTheme.body3),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColorScheme.backgroundSky,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(card.answer, style: AppTextTheme.body3),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _ReviewButton(label: 'Again', color: Color(0xFFE53935)),
                _ReviewButton(label: 'Hard', color: Color(0xFFFFB74D)),
                _ReviewButton(label: 'Good', color: Color(0xFF1BBF72)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.track_changes_rounded),
                const SizedBox(width: 8),
                Text(
                  'EF ${card.easeFactor.toStringAsFixed(1)} · Interval ${card.intervalDays}일',
                  style: AppTextTheme.body3
                      .copyWith(color: AppColorScheme.caption),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SpacedRepetitionNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Spaced Repetition 정책', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            _NoteRow('Ease Factor 하한선 1.3 유지'),
            _NoteRow('Interval 1일 → 6일 → 14일 → 30일 샘플'),
            _NoteRow('복습 실패 시 Interval 0으로 초기화'),
            _NoteRow('푸시 알림은 복습 2시간 전에 발송'),
          ],
        ),
      ),
    );
  }
}

class _SummaryBadge extends StatelessWidget {
  const _SummaryBadge({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColorScheme.grayScaleLineLight,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text('$value',
                style: AppTextTheme.h4.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: AppTextTheme.body4),
          ],
        ),
      ),
    );
  }
}

class _ReviewButton extends StatelessWidget {
  const _ReviewButton({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(90, 44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _NoteRow extends StatelessWidget {
  const _NoteRow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTextTheme.body3)),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColorScheme.grayScaleWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Icon(Icons.style_outlined, size: 40),
          const SizedBox(height: 12),
          Text('등록된 플래시카드가 없습니다.', style: AppTextTheme.body2),
        ],
      ),
    );
  }
}
