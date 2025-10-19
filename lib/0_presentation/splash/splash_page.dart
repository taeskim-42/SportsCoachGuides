import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/utils/image/asset_picture.dart';
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
            const AppPicutreAsset(assetType: AppPicutreAssetType.logoWhite),
            AppSpacing.vSmall,
            const AppPicutreAsset(assetType: AppPicutreAssetType.logoText),
            AppSpacing.vXTiny,
            Text(
              '인공지능 운동 강도 프로그램',
              style: AppTextTheme.caption.copyWith(
                color: AppColorScheme.grayScaleWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
