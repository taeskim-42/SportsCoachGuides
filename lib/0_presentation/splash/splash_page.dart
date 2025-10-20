import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/1_application/splash/splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_martial_arts_rounded,
              size: 64,
              color: AppColorScheme.grayScaleWhite,
            ),
            AppSpacing.vSmall,
            Text(
              '생활체육지도자 학습 코치',
              style: AppTextTheme.h4.copyWith(
                color: AppColorScheme.grayScaleWhite,
              ),
            ),
            AppSpacing.vXTiny,
            Text(
              '인공지능 기반 맞춤 학습을 준비하고 있어요',
              style: AppTextTheme.body3.copyWith(
                color: AppColorScheme.grayScaleWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
