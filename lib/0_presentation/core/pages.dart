import 'package:get/get.dart';
import 'package:oli/0_presentation/preview/feature_preview_binding.dart';
import 'package:oli/0_presentation/preview/feature_preview_page.dart';
import 'package:oli/0_presentation/splash/splash_page.dart';
import 'package:oli/0_presentation/splash/splash_page_binding.dart';

List<GetPage> allPages = [
  GetPage(
    name: "/",
    binding: SplashPageBinding(),
    page: () => const SplashPage(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: "/study",
    binding: FeaturePreviewBinding(),
    page: () => const FeaturePreviewPage(),
    transition: Transition.fadeIn,
  ),
];
