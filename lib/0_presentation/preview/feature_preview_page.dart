import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/1_application/preview/feature_preview_controller.dart';
import 'package:oli/0_presentation/preview/widgets/auth_preview_section.dart';
import 'package:oli/0_presentation/preview/widgets/dashboard_preview_section.dart';
import 'package:oli/0_presentation/preview/widgets/flashcard_preview_section.dart';
import 'package:oli/0_presentation/preview/widgets/question_preview_section.dart';
import 'package:oli/0_presentation/preview/widgets/section_header.dart';

class FeaturePreviewPage extends GetView<FeaturePreviewController> {
  const FeaturePreviewPage({super.key});

  static const _navItems = [
    _PreviewDestination('인증', Icons.lock_open_rounded),
    _PreviewDestination('문제풀이', Icons.fact_check_rounded),
    _PreviewDestination('플래시카드', Icons.style_rounded),
    _PreviewDestination('대시보드', Icons.insights_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.grayScaleBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Obx(
            () {
              final index = controller.currentIndex.value;
              final completeness = controller.completenessScore;
              final header = SectionHeader(
                title: _navItems[index].label,
                completeness: completeness,
              );

              final pages = [
                AuthPreviewSection(header: header),
                QuestionPreviewSection(header: header),
                FlashcardPreviewSection(header: header),
                DashboardPreviewSection(header: header),
              ];

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: child,
                ),
                child: IndexedStack(
                  key: ValueKey(index),
                  index: index,
                  children: pages,
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(
          () => NavigationBar(
            height: 72,
            elevation: 2,
            backgroundColor: AppColorScheme.grayScaleWhite,
            indicatorColor: AppColorScheme.buttonBackground,
            selectedIndex: controller.currentIndex.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: controller.onNavIndexChanged,
            destinations: [
              for (final item in _navItems)
                NavigationDestination(
                  icon: Icon(item.icon, color: AppColorScheme.caption),
                  selectedIcon: Icon(
                    item.icon,
                    color: AppColorScheme.primaryFontLine,
                  ),
                  label: item.label,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewDestination {
  const _PreviewDestination(this.label, this.icon);

  final String label;
  final IconData icon;
}
