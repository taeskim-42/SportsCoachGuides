import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/utils/util.dart';
import 'package:oli/0_presentation/page/app_page.dart';
import 'package:oli/1_application/question/question_practice_controller.dart';
import 'package:oli/2_domain/question/question.dart';

class QuestionPracticePage extends GetView<QuestionPracticeController> {
  const QuestionPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AliScaffold(
      withNavBar: true,
      backgroundColor: AppColorScheme.grayScaleBackground,
      bodyPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderSection(controller: controller),
                AppSpacing.vMedium,
                _TrackSelector(controller: controller),
                AppSpacing.vSmall,
                _YearSelector(controller: controller),
                AppSpacing.vSmall,
                _QuestionList(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.controller});

  final QuestionPracticeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '생활체육지도자 기출 학습',
          style: AppTextTheme.h1.copyWith(
            color: AppColorScheme.title,
          ),
        ),
        AppSpacing.vXTiny,
        Text(
          '종목과 연도를 선택하고 주요 문제를 풀어보세요.',
          style: AppTextTheme.body3.copyWith(
            color: AppColorScheme.body,
          ),
        ),
      ],
    );
  }
}

class _TrackSelector extends StatelessWidget {
  const _TrackSelector({required this.controller});

  final QuestionPracticeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '종목 선택',
          style: AppTextTheme.h4.copyWith(
            color: AppColorScheme.title,
          ),
        ),
        AppSpacing.vTiny,
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: controller.tracks
              .map(
                (track) => ChoiceChip(
                  label: Text(track, style: AppTextTheme.body2),
                  selected: controller.selectedTrack == track,
                  onSelected: (_) => controller.selectTrack(track),
                  selectedColor: AppColorScheme.buttonBackground,
                  disabledColor: AppColorScheme.grayScaleBackground,
                  labelStyle: AppTextTheme.body2.copyWith(
                    color: controller.selectedTrack == track
                        ? AppColorScheme.primaryFontLine
                        : AppColorScheme.body,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _YearSelector extends StatelessWidget {
  const _YearSelector({required this.controller});

  final QuestionPracticeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '연도 선택',
          style: AppTextTheme.h4.copyWith(
            color: AppColorScheme.title,
          ),
        ),
        AppSpacing.vTiny,
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: controller.years
              .map(
                (year) => ChoiceChip(
                  label: Text('$year', style: AppTextTheme.body2),
                  selected: controller.selectedYear == year,
                  onSelected: (_) => controller.selectYear(year),
                  selectedColor: AppColorScheme.primaryBackground,
                  labelStyle: AppTextTheme.body2.copyWith(
                    color: controller.selectedYear == year
                        ? AppColorScheme.grayScaleWhite
                        : AppColorScheme.body,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _QuestionList extends StatelessWidget {
  const _QuestionList({required this.controller});

  final QuestionPracticeController controller;

  @override
  Widget build(BuildContext context) {
    if (controller.errorMessage != null) {
      return Expanded(
        child: Center(
          child: Text(
            controller.errorMessage!,
            style: AppTextTheme.body2.copyWith(
              color: AppColorScheme.caption,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (controller.questions.isEmpty) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final question = controller.questions[index];
          final selectedOption = controller.selectedOptionFor(question.id);
          final isFlashcard = controller.isFlashcard(question.id);
          final isExpanded = controller.isExpanded(question.id);
          return _QuestionCard(
            question: question,
            selectedOption: selectedOption,
            isFlashcard: isFlashcard,
            isExpanded: isExpanded,
            onOptionSelected: (option) => controller.chooseOption(
              questionId: question.id,
              option: option,
            ),
            onToggleFlashcard: () => controller.toggleFlashcard(question.id),
            onToggleExplanation: () =>
                controller.toggleExplanation(question.id),
          );
        },
        separatorBuilder: (_, __) => AppSpacing.vSmall,
        itemCount: controller.questions.length,
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    required this.selectedOption,
    required this.isFlashcard,
    required this.isExpanded,
    required this.onOptionSelected,
    required this.onToggleFlashcard,
    required this.onToggleExplanation,
  });

  final Question question;
  final String? selectedOption;
  final bool isFlashcard;
  final bool isExpanded;
  final ValueChanged<String> onOptionSelected;
  final VoidCallback onToggleFlashcard;
  final VoidCallback onToggleExplanation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorScheme.grayScaleWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColorScheme.dimmed10,
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${question.year}년 • ${question.subject}',
                      style: AppTextTheme.caption1,
                    ),
                    AppSpacing.vTiny,
                    Text(
                      question.questionText,
                      style: AppTextTheme.body2Long.copyWith(
                        color: AppColorScheme.title,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              AppTap(
                onTap: onToggleFlashcard,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isFlashcard
                        ? AppColorScheme.buttonBackground
                        : AppColorScheme.grayScaleBackground,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    isFlashcard ? '복습카드 저장됨' : '복습카드로 저장',
                    style: AppTextTheme.body3.copyWith(
                      color: isFlashcard
                          ? AppColorScheme.primaryFontLine
                          : AppColorScheme.body,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.vSmall,
          Column(
            children: question.options.map((option) {
              final isSelected = option == selectedOption;
              final isCorrect = option == question.answer;
              final backgroundColor = isSelected
                  ? (isCorrect
                      ? AppColorScheme.buttonBackground
                      : AppColorScheme.grayScaleBackground)
                  : AppColorScheme.grayScaleWhite;
              final borderColor = isSelected
                  ? (isCorrect
                      ? AppColorScheme.primaryFontLine
                      : AppColorScheme.grayScaleLineBox)
                  : AppColorScheme.grayScaleLineLight;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => onOptionSelected(option),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                    ),
                    child: Text(
                      option,
                      style: AppTextTheme.body2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onToggleExplanation,
              child: Text(
                isExpanded ? '해설 접기' : '정답 & 해설 보기',
                style: AppTextTheme.body3.copyWith(
                  color: AppColorScheme.primaryFontLine,
                ),
              ),
            ),
          ),
          if (isExpanded) ...[
            AppSpacing.vTiny,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColorScheme.backgroundSky,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '정답: ${question.answer}',
                    style: AppTextTheme.body2.copyWith(
                      color: AppColorScheme.primaryFontLine,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.vTiny,
                  Text(
                    question.explanation,
                    style: AppTextTheme.body3,
                  ),
                  if (question.youtubeLink != null) ...[
                    AppSpacing.vTiny,
                    Text(
                      '추천 영상: ${question.youtubeLink}',
                      style: AppTextTheme.caption1.copyWith(
                        color: AppColorScheme.secondarySky,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
