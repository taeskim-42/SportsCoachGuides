import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/page/app_page.dart';
import 'package:oli/1_application/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AliScaffold(
      withNavBar: true,
      appBar: const AliAppBar(
        titleText: '학습 프로필',
      ),
      body: Obx(
        () {
          final user = controller.user.value;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.vMedium,
                Text(
                  user.name.isNotEmpty ? user.name : '학습자',
                  style: AppTextTheme.h1,
                ),
                AppSpacing.vTiny,
                Text(
                  user.introduce ?? '학습 목표를 추가해 보세요.',
                  style: AppTextTheme.body3,
                ),
                AppSpacing.vMedium,
                Container(
                  padding: const EdgeInsets.all(16),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이번 주 학습 목표',
                        style: AppTextTheme.h4,
                      ),
                      AppSpacing.vTiny,
                      Text(
                        '축구 전술 파트 3회 반복 • 플래시카드 복습 5세트',
                        style: AppTextTheme.body3,
                      ),
                      AppSpacing.vSmall,
                      Text(
                        'Spaced Repetition 복습 알림은 MVP+1 로드맵에 맞춰 개발 중입니다.',
                        style: AppTextTheme.caption1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
