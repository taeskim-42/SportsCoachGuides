import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/design_system.dart';

class AppTap extends StatelessWidget {
  final void Function() onTap;
  final Widget child;

  const AppTap({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}

class AppBox extends StatelessWidget {
  late final double borderRadius;
  late final double borderWidth;
  late final Color borderColor;

  final bool withShadow;
  late final double shadowRadius;
  late final double shadowBlurRadius;
  late final Color shadowColor;
  final Offset? shadowOffset;

  late final EdgeInsetsGeometry padding;
  late final Color backgroundColor;
  final Widget? child;
  final double? width;
  final double? height;

  AppBox({
    Key? key,
    double? borderRadius,
    double? borderWidth,
    Color? borderColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double? shadowRadius,
    double? shadowBlurRadius,
    Color? shadowColor,
    this.withShadow = false,
    this.shadowOffset,
    this.child,
    this.width,
    this.height,
  }) : super(key: key) {
    this.borderColor = borderColor ?? AppColorScheme.grayScaleLineBox;
    this.borderWidth = borderWidth ?? 1;
    this.borderRadius = borderRadius ?? 4;
    this.padding =
        padding ?? EdgeInsets.all(AppSpacing.tiny - this.borderWidth);
    this.shadowBlurRadius = shadowBlurRadius ?? 0;
    this.shadowRadius = shadowRadius ?? 0;
    this.shadowColor = shadowColor ?? AppColorScheme.dimmed10;
    this.backgroundColor = backgroundColor ?? AppColorScheme.grayScaleWhite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(width: borderWidth, color: borderColor),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: shadowRadius,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset ?? Offset.zero,
          )
        ],
      ),
      child: child,
    );
  }
}
