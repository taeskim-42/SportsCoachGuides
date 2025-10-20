import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/preview/widgets/section_header.dart';
import 'package:oli/1_application/preview/feature_preview_controller.dart';
import 'package:oli/1_application/preview/model/progress_metric.dart';
import 'package:oli/1_application/preview/model/youtube_resource.dart';

class DashboardPreviewSection extends GetView<FeaturePreviewController> {
  const DashboardPreviewSection({required this.header, super.key});

  final SectionHeader header;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final metrics = controller.metrics;
        final videos = controller.youtubeResources;
        return SingleChildScrollView(
          key: const ValueKey('dashboard-preview'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              _MetricsCard(metrics: metrics),
              const SizedBox(height: 20),
              const _WeakAreaCard(),
              const SizedBox(height: 20),
              _YoutubeOverviewCard(resources: videos),
            ],
          ),
        );
      },
    );
  }
}

class _MetricsCard extends StatelessWidget {
  const _MetricsCard({required this.metrics});

  final List<ProgressMetric> metrics;

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
            Text('핵심 지표', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            for (final metric in metrics)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(metric.title, style: AppTextTheme.body2),
                        Text(metric.targetLabel, style: AppTextTheme.body3),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(metric.description,
                        style: AppTextTheme.body3
                            .copyWith(color: AppColorScheme.caption)),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: metric.value,
                        minHeight: 8,
                        backgroundColor: AppColorScheme.grayScaleLineLight,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColorScheme.primaryFontLine,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(metric.percentageLabel,
                          style: AppTextTheme.body3),
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

class _WeakAreaCard extends StatelessWidget {
  const _WeakAreaCard();

  @override
  Widget build(BuildContext context) {
    final weakAreas = [
      ('트레이닝 이론', '정답률 52%'),
      ('멘탈 코칭', '정답률 58%'),
      ('스포츠 윤리', '정답률 63%'),
    ];

    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('취약 영역 집중', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            Text(
              '정답률 65% 미만 영역을 자동으로 큐레이션합니다. 추가 학습자료와 플래시카드를 확인하세요.',
              style: AppTextTheme.body3,
            ),
            const SizedBox(height: 16),
            for (final area in weakAreas)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColorScheme.grayScaleLineLight),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.flag_outlined),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(area.$1, style: AppTextTheme.body2),
                    ),
                    Text(area.$2, style: AppTextTheme.body3),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _YoutubeOverviewCard extends StatelessWidget {
  const _YoutubeOverviewCard({required this.resources});

  final List<YoutubeResource> resources;

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
                const Icon(Icons.ondemand_video_rounded),
                const SizedBox(width: 8),
                Text('유튜브 학습 큐레이션', style: AppTextTheme.h4),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '문제별로 연결된 영상과 시청 시간 데이터를 기반으로 학습 몰입도를 확인합니다.',
              style: AppTextTheme.body3,
            ),
            const SizedBox(height: 16),
            for (final resource in resources)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColorScheme.backgroundSky,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resource.title, style: AppTextTheme.body2),
                          const SizedBox(height: 4),
                          Text(
                            '${resource.channelName} · ${resource.duration}',
                            style: AppTextTheme.body3
                                .copyWith(color: AppColorScheme.caption),
                          ),
                          const SizedBox(height: 4),
                          Text('연결 문제: ${resource.relatedQuestionId}',
                              style: AppTextTheme.body4),
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
