import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/core/loading/loading_overlay.dart';
import 'package:oli/0_presentation/core/utils/nav/bottom_nav_bar.dart';
import 'package:oli/0_presentation/core/utils/util.dart';
import 'package:oli/1_application/core/global_controller.dart';

class AppPage extends StatelessWidget {
  final bool isLoading;
  final Widget page;
  final Widget fallback;

  const AppPage({
    Key? key,
    required this.isLoading,
    required this.page,
    this.fallback = const AliLoadingOverlayScaffold(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isLoading ? const SizedBox() : page,
        Visibility(
          visible: isLoading,
          child: fallback,
        ),
      ],
    );
  }
}

enum AliAppBarIconType {
  cross,
  crossWhite,
  leftArrow,
}

class AliAppBar extends GetView<GlobalController>
    implements PreferredSizeWidget {
  final AliAppBarIconType iconType;
  final String? titleText;
  final String? actionText;
  final bool inOverlay;
  final Color? backgroundColor;
  final void Function()? actionCallback;

  const AliAppBar({
    super.key,
    this.iconType = AliAppBarIconType.leftArrow,
    this.titleText,
    this.actionText,
    this.actionCallback,
    this.backgroundColor,
    this.inOverlay = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () => controller.router.back(closeOverlay: !inOverlay),
        icon: _getIcon(),
      ),
      centerTitle: true,
      title: _getTitle(),
      actions: _getAction(),
      elevation: 0,
      backgroundColor: backgroundColor ?? Colors.transparent,
    );
  }

  Widget _getIcon() {
    switch (iconType) {
      case AliAppBarIconType.cross:
        return Icon(
          Icons.close,
          color: AppColorScheme.grayScaleIconDart,
        );
      case AliAppBarIconType.leftArrow:
        return Icon(
          Icons.arrow_back_ios_new,
          color: AppColorScheme.grayScaleIconDart,
        );
      case AliAppBarIconType.crossWhite:
        return Icon(
          Icons.close,
          color: AppColorScheme.grayScaleWhite,
        );
    }
  }

  Widget? _getTitle() {
    if (titleText == null) {
      return null;
    } else {
      return Text(
        titleText!,
        style: AppTextTheme.h3.copyWith(height: 1),
      );
    }
  }

  List<Widget>? _getAction() {
    if (actionText == null) {
      return null;
    } else {
      return [
        AppTap(
          onTap: () => actionCallback?.call(),
          child: Center(
            child: Text(
              actionText!,
              style: AppTextTheme.body2.copyWith(
                color: AppColorScheme.primary300,
              ),
            ),
          ),
        ),
        AppSpacing.hXBase,
      ];
    }
  }
}

class AliScaffold extends StatelessWidget {
  final AliAppBar? appBar;
  final Widget body;
  final EdgeInsetsGeometry bodyPadding;
  final bool withNavBar;
  final Color? backgroundColor;
  final Widget? navBar;
  final bool resizeToAvoidBottomInset;

  const AliScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.bodyPadding = const EdgeInsets.all(20),
    this.withNavBar = false,
    this.navBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: bodyPadding,
        child: Column(
          children: [
            Expanded(child: body),
            // GetPlatform.isIOS ? AliSpacing.vBase : AliSpacing.none
          ],
        ),
      ),
      bottomNavigationBar: withNavBar
          ? (navBar == null ? const AppBottomNavigationBar() : navBar!)
          : null,
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
