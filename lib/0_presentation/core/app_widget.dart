import 'package:oli/0_presentation/core/loading/loading_overlay.dart';
import 'package:oli/0_presentation/core/pages.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:oli/3_infrastructure/core/environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends GetView<GlobalController> {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: aliBuilder,
      debugShowCheckedModeBanner: EnvironmentConfig.isDev,
      theme: _buildAppTheme(),
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

ThemeData _buildAppTheme() {
  final colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColorScheme.primary300,
    onPrimary: AppColorScheme.grayScaleWhite,
    secondary: AppColorScheme.secondarySky,
    onSecondary: Colors.black,
    error: AppColorScheme.red,
    onError: Colors.white,
    surface: AppColorScheme.grayScaleBackground,
    onSurface: AppColorScheme.title,
    background: AppColorScheme.grayScaleBackground,
    onBackground: AppColorScheme.title,
  );

  final baseTextTheme = ThemeData.dark().textTheme.apply(
        bodyColor: AppColorScheme.title,
        displayColor: AppColorScheme.title,
      );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColorScheme.grayScaleBackground,
    textTheme: baseTextTheme,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColorScheme.grayScaleWhite,
      indicatorColor: AppColorScheme.buttonBackground,
      labelTextStyle: MaterialStateProperty.all(AppTextTheme.body4),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorScheme.primaryFontLine,
        foregroundColor: Colors.white,
        textStyle: AppTextTheme.body2.copyWith(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );
}
