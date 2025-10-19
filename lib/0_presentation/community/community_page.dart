import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/page/app_page.dart';
import 'package:oli/1_application/community/community_controller.dart';

class CommunityPage extends GetView<CommunityController> {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AliScaffold(
      withNavBar: true,
      appBar: const AliAppBar(
        titleText: '커뮤니티',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '학습 커뮤니티는 준비 중이에요',
                style: AppTextTheme.h3,
                textAlign: TextAlign.center,
              ),
              AppSpacing.vTiny,
              Text(
                '플래시카드 공유와 실습 영상 피드 기능을 곧 선보일 예정입니다.',
                style: AppTextTheme.body3,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
