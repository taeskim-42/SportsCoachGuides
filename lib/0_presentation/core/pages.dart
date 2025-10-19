import 'package:get/get.dart';
import 'package:oli/0_presentation/community/community_binding.dart';
import 'package:oli/0_presentation/community/community_page.dart';
import 'package:oli/0_presentation/profile/profile_binding.dart';
import 'package:oli/0_presentation/profile/profile_page.dart';
import 'package:oli/0_presentation/question/question_practice_binding.dart';
import 'package:oli/0_presentation/question/question_practice_page.dart';
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
    name: "/diagnosis",
    binding: QuestionPracticeBinding(),
    page: () => const QuestionPracticePage(),
  ),
  GetPage(
    name: "/community",
    binding: CommunityBinding(),
    page: () => const CommunityPage(),
  ),
  GetPage(
    name: "/profile",
    binding: ProfileBinding(),
    page: () => const ProfilePage(),
  ),
];
