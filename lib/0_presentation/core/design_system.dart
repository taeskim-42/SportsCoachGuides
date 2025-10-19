import 'package:flutter/material.dart';

extension AppColorScheme on ColorScheme {
  static Color get red => const Color(0xFFEC3F34);

  static Color get primary300 => const Color(0xFF0066FE);
  static Color get primaryBackground => const Color(0xFF3657DD);
  static Color get primaryFontLine => const Color(0xFF143CDF);

  static Color get secondarySky => const Color(0xFF4DB8E7);

  static Color get title => const Color(0xFF111111);
  static Color get body => const Color(0xFF555555);

  static Color get caption => const Color(0xFF999999);

  static Color get dimmed10 => const Color(0xFF000000).withOpacity(0.1);

  static Color get dimmed30 => const Color(0xFF000000).withOpacity(0.3);
  static Color get dimmed70 => const Color(0xFF000000).withOpacity(0.7);
  static Color get dimmed80 => const Color(0xFF000000).withOpacity(0.8);

  static Color get grayScaleWhite => const Color(0xFFFFFFFF);
  static Color get grayScaleLineBox => const Color(0xFFE0E1E2);
  static Color get grayScaleIconDart => const Color(0xFF4D4D4D);
  static Color get grayScaleBackground => const Color(0xFFF7F8F9);
  static Color get grayScaleBackgroundDisabled => const Color(0xFFD8D8D8);
  static Color get grayScaleIconLight => const Color(0xFFC4C4C4);
  static Color get grayScaleLineLight => const Color(0xFFEEEEEF);

  static Color get buttonBackground => const Color(0xFFEBF0FD);

  static Color get backgroundBlue => const Color(0xFFE6ECFF);
  static Color get backgroundSky => const Color(0xFFE6F3FF);
}

extension AppTextTheme on TextTheme {
  // static const defaultFontFamily = "NotoSansKR";

  static const defaultFontFamily = "";

  static double _getFontHeight(double fontSize, double height) =>
      (height / fontSize);

  static double _getLetterSpace(double fontSize, double percentageValue) =>
      (fontSize * percentageValue / 100);

  static TextStyle _getStyle({
    required double fontSize,
    required double lineHeight,
    required Color color,
    double letterSpacing = -5,
  }) {
    return TextStyle(
      fontFamily: defaultFontFamily,
      fontSize: fontSize,
      height: _getFontHeight(fontSize, lineHeight),
      letterSpacing: _getLetterSpace(fontSize, letterSpacing),
      color: color,
    );
  }

  static TextStyle get h1 =>
      _getStyle(fontSize: 20, lineHeight: 26, color: AppColorScheme.title);

  static TextStyle get h3 =>
      _getStyle(fontSize: 18, lineHeight: 26, color: AppColorScheme.title);

  static TextStyle get h4 =>
      _getStyle(fontSize: 17, lineHeight: 22, color: AppColorScheme.title);

  static TextStyle get h5 =>
      _getStyle(fontSize: 15, lineHeight: 20, color: AppColorScheme.title);
  static TextStyle get body0 =>
      _getStyle(fontSize: 10, lineHeight: 10, color: AppColorScheme.body);
  static TextStyle get body1 =>
      _getStyle(fontSize: 14, lineHeight: 22, color: AppColorScheme.body);

  static TextStyle get body2 =>
      _getStyle(fontSize: 14, lineHeight: 18, color: AppColorScheme.body);
  static TextStyle get body2Long =>
      _getStyle(fontSize: 14, lineHeight: 22, color: AppColorScheme.body);
  static TextStyle get body3 =>
      _getStyle(fontSize: 12, lineHeight: 19, color: AppColorScheme.body);

  static TextStyle get body4 =>
      _getStyle(fontSize: 12, lineHeight: 16, color: AppColorScheme.body);

  static TextStyle get caption =>
      _getStyle(fontSize: 14, lineHeight: 18, color: AppColorScheme.caption);

  static TextStyle get caption1 =>
      _getStyle(fontSize: 12, lineHeight: 18, color: AppColorScheme.caption);
  static TextStyle get caption2 =>
      _getStyle(fontSize: 11, lineHeight: 16, color: AppColorScheme.caption);
}

class AppSpacing {
  /// 4
  static double xTiny = 4;

  /// 8
  static double tiny = 8;

  /// 12
  static double xSmall = 12;

  /// 16
  static double small = 16;

  /// 20
  static double xBase = 20;

  /// 24
  static double base = 24;

  /// 32
  static double medium = 32;

  /// 40
  static double xMedium = 40;

  /// 48
  static double large = 48;

  /// 64
  static double xLarge = 64;

  /// 0
  static SizedBox get none => const SizedBox();

  /// 4
  static SizedBox get hXTiny => const SizedBox(width: 4);

  /// 8
  static SizedBox get hTiny => const SizedBox(width: 8);

  /// 12
  static SizedBox get hXSmall => const SizedBox(width: 12);

  /// 16
  static SizedBox get hSmall => const SizedBox(width: 16);

  /// 20
  static SizedBox get hXBase => const SizedBox(width: 20);

  /// 24
  static SizedBox get hBase => const SizedBox(width: 24);

  /// 32
  static SizedBox get hMedium => const SizedBox(width: 32);

  /// 40
  static SizedBox get hXMedium => const SizedBox(width: 40);

  /// 48
  static SizedBox get hLarge => const SizedBox(width: 48);

  /// 64
  static SizedBox get hXLarge => const SizedBox(width: 64);

  /// 4
  static SizedBox get vXTiny => const SizedBox(height: 4);

  /// 8
  static SizedBox get vTiny => const SizedBox(height: 8);

  /// 12
  static SizedBox get vXSmall => const SizedBox(height: 12);

  /// 16
  static SizedBox get vSmall => const SizedBox(height: 16);

  /// 20
  static SizedBox get vXBase => const SizedBox(height: 20);

  /// 24
  static SizedBox get vBase => const SizedBox(height: 24);

  /// 32
  static SizedBox get vMedium => const SizedBox(height: 32);

  /// 40
  static SizedBox get vXMedium => const SizedBox(height: 40);

  /// 48
  static SizedBox get vLarge => const SizedBox(height: 48);

  /// 64
  static SizedBox get vXLarge => const SizedBox(height: 64);
}
