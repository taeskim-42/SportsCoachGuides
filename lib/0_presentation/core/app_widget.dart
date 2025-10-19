import 'package:oli/3_infrastructure/core/environment.dart';
import 'package:oli/0_presentation/core/loading/loading_overlay.dart';
import 'package:oli/0_presentation/core/pages.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends GetView<GlobalController> {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: aliBuilder,
      debugShowCheckedModeBanner: EnvironmentConfig.isDev,
      getPages: allPages,
    );
  }
}

Widget aliBuilder(BuildContext ctx, Widget? child) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Get.focusScope?.unfocus(),
    child: AliLoadingOverlay(
      child: child!,
    ),
  );
}
