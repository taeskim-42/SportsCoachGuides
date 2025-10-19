import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum AppLottieAssetType {
  chatbotLoading,
  loading,
}

class AppLottieAsset extends StatelessWidget {
  final AppLottieAssetType type;
  final double? width;
  final double? height;
  const AppLottieAsset({
    Key? key,
    required this.type,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppLottieAssetType.chatbotLoading:
        return Lottie.asset(
          'assets/lotties/chat_dot.json',
          width: 40,
          height: 10,
        );
      case AppLottieAssetType.loading:
        return Lottie.asset(
          'assets/lotties/loading_circle.json',
          width: width,
          height: height,
        );
    }
  }
}
