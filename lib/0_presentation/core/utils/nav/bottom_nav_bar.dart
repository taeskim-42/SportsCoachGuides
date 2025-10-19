import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/utils/image/asset_picture.dart';
import 'package:oli/1_application/core/bottom_nav_bar_controller.dart';

class AppBottomNavigationBar extends GetView<BottomNavBarController> {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColorScheme.grayScaleWhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: controller.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (s) => controller.currentIndex = s,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.diagnosisEmpty),
                const SizedBox(height: 2),
                Text('진단하기', style: AppTextTheme.body0),
              ],
            ),
            activeIcon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.diagnosisFill),
                const SizedBox(height: 2),
                Text('진단하기',
                    style: AppTextTheme.body0.copyWith(
                      color: AppColorScheme.primaryFontLine,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.communityEmpty),
                const SizedBox(height: 5),
                Text('커뮤니티', style: AppTextTheme.body0),
              ],
            ),
            activeIcon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.communityFill),
                const SizedBox(height: 5),
                Text('커뮤니티',
                    style: AppTextTheme.body0.copyWith(
                      color: AppColorScheme.primaryFontLine,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.profileEmpty),
                const SizedBox(height: 5),
                Text('프로필', style: AppTextTheme.body0),
              ],
            ),
            activeIcon: Column(
              children: [
                const AppPicutreAsset(
                    assetType: AppPicutreAssetType.profileFill),
                const SizedBox(height: 5),
                Text('프로필',
                    style: AppTextTheme.body0.copyWith(
                      color: AppColorScheme.primaryFontLine,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
