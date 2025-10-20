import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/preview/widgets/section_header.dart';
import 'package:oli/1_application/preview/feature_preview_controller.dart';
import 'package:oli/1_application/preview/model/question_preview.dart';
import 'package:oli/1_application/preview/model/youtube_resource.dart';

class QuestionPreviewSection extends GetView<FeaturePreviewController> {
  const QuestionPreviewSection({required this.header, super.key});

  final SectionHeader header;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final tracks = controller.availableTracks;
        final years = controller.availableYears;
        final questions = controller.filteredQuestions;
        final selected = controller.selectedQuestion ?? questions.firstOrNull;

        return SingleChildScrollView(
          key: const ValueKey('question-preview'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              _FilterPanel(
                tracks: tracks,
                years: years,
                selectedTrack: controller.selectedTrack.value,
                selectedYear: controller.selectedYear.value,
                onTrackSelected: controller.onTrackSelected,
                onYearSelected: controller.onYearSelected,
              ),
              const SizedBox(height: 16),
              _QuestionList(
                questions: questions,
                selectedId: controller.selectedQuestionId.value,
                onTap: controller.onQuestionSelected,
              ),
              const SizedBox(height: 20),
              if (selected != null) ...[
                _QuestionDetailCard(question: selected),
                const SizedBox(height: 20),
                _YoutubeRecommendationCard(
                  resources: controller.youtubeResources
                      .where(
                        (element) => element.relatedQuestionId == selected.id,
                      )
                      .toList(),
                ),
              ] else
                _EmptyState(),
            ],
          ),
        );
      },
    );
  }
}

class _FilterPanel extends StatelessWidget {
  const _FilterPanel({
    required this.tracks,
    required this.years,
    required this.selectedTrack,
    required this.selectedYear,
    required this.onTrackSelected,
    required this.onYearSelected,
  });

  final List<String> tracks;
  final List<int> years;
  final String selectedTrack;
  final int selectedYear;
  final ValueChanged<String> onTrackSelected;
  final ValueChanged<int> onYearSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('종목 선택', style: AppTextTheme.body2),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final track in tracks)
                  ChoiceChip(
                    label: Text(track),
                    selected: track == selectedTrack,
                    onSelected: (_) => onTrackSelected(track),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text('연도별 기출', style: AppTextTheme.body2),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final year in years)
                  ChoiceChip(
                    label: Text('$year'),
                    selected: year == selectedYear,
                    onSelected: (_) => onYearSelected(year),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionList extends StatelessWidget {
  const _QuestionList({
    required this.questions,
    required this.selectedId,
    required this.onTap,
  });

  final List<QuestionPreview> questions;
  final String selectedId;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const _EmptyState();
    }

    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListView.separated(
        itemCount: questions.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final question = questions[index];
          final isSelected = question.id == selectedId;
          return ListTile(
            onTap: () => onTap(question.id),
            selected: isSelected,
            selectedTileColor: AppColorScheme.backgroundBlue,
            title: Text(question.subject, style: AppTextTheme.body2),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.question,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.body3,
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _StatusChip(label: question.difficultyLabel),
                    _StatusChip(label: question.completionLabel),
                    _StatusChip(
                        label:
                            '정답률 ${(question.correctRate * 100).toStringAsFixed(0)}%'),
                  ],
                ),
              ],
            ),
            trailing: Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected
                  ? AppColorScheme.primaryFontLine
                  : AppColorScheme.grayScaleIconLight,
            ),
          );
        },
      ),
    );
  }
}

class _QuestionDetailCard extends StatelessWidget {
  const _QuestionDetailCard({required this.question});

  final QuestionPreview question;

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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColorScheme.backgroundBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${question.year}년 · ${question.track}',
                    style: AppTextTheme.body3,
                  ),
                ),
                const SizedBox(width: 12),
                Text(question.subject, style: AppTextTheme.body2),
              ],
            ),
            const SizedBox(height: 16),
            Text(question.question, style: AppTextTheme.body2Long),
            const SizedBox(height: 16),
              for (var index = 0; index < question.options.length; index++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: _OptionTile(
                    option: question.options[index],
                    index: index,
                    isAnswer: index == question.answerIndex,
                  ),
                ),
            const SizedBox(height: 20),
            DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColorScheme.grayScaleLineLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      tabs: [
                        Tab(text: '정답 해설'),
                        Tab(text: '강화 학습 포인트'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: TabBarView(
                      children: [
                        Text(
                          question.explanation,
                          style: AppTextTheme.body3,
                        ),
                        Text(
                          '태그: ${question.tags.join(', ')}\n동일 개념 문제 2문 추천 · 플래시카드 저장 권장',
                          style: AppTextTheme.body3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _YoutubeRecommendationCard extends StatelessWidget {
  const _YoutubeRecommendationCard({required this.resources});

  final List<YoutubeResource> resources;

  @override
  Widget build(BuildContext context) {
    if (resources.isEmpty) {
      return const SizedBox.shrink();
    }
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('연계 유튜브 강의', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            for (final resource in resources)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColorScheme.backgroundSky,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.play_arrow_rounded),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resource.title as String,
                              style: AppTextTheme.body2),
                          const SizedBox(height: 4),
                          Text(
                            '${resource.channelName} · ${resource.duration}',
                            style: AppTextTheme.body3
                                .copyWith(color: AppColorScheme.caption),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.open_in_new_rounded),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.option,
    required this.index,
    required this.isAnswer,
  });

  final String option;
  final int index;
  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    final label = String.fromCharCode('A'.codeUnitAt(0) + index);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAnswer
              ? AppColorScheme.primaryFontLine
              : AppColorScheme.grayScaleLineLight,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: isAnswer
                ? AppColorScheme.primaryFontLine
                : AppColorScheme.grayScaleLineLight,
            child: Text(
              label,
              style: TextStyle(
                color: isAnswer ? Colors.white : Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              option,
              style: AppTextTheme.body3,
            ),
          ),
          if (isAnswer)
            Icon(Icons.check_circle,
                color: AppColorScheme.primaryFontLine, size: 20),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: AppTextTheme.body4),
      backgroundColor: AppColorScheme.grayScaleLineLight,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.help_outline_rounded, size: 40),
          const SizedBox(height: 12),
          Text(
            '선택된 조건의 기출 문제가 없습니다.',
            style: AppTextTheme.body2,
          ),
        ],
      ),
    );
  }
}
