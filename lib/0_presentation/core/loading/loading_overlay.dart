import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/utils/lottie/asset_lottie.dart';
import 'package:oli/0_presentation/core/utils/scroll/scroll.dart';
import 'package:oli/1_application/core/global_controller.dart';

class AliLoadingOverlay extends GetView<GlobalController> {
  final Widget child;
  const AliLoadingOverlay({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child,
        ),
        Obx(() => controller.isLoading.value
            ? const AliLoadingOverlayScaffold()
            : const SizedBox()),
      ],
    );
  }
}

class AliLoadingOverlayScaffold extends StatelessWidget {
  const AliLoadingOverlayScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.dimmed70,
      body: const Center(
        child: AppLottieAsset(type: AppLottieAssetType.loading),
      ),
    );
  }
}
