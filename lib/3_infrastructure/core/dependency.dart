import 'package:get/get.dart';
import 'package:oli/1_application/core/bottom_nav_bar_controller.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:oli/2_domain/core/i_connection.dart';
import 'package:oli/2_domain/question/i_question_repository.dart';
import 'package:oli/2_domain/user/i_user_repository.dart';
import 'package:oli/1_application/core/router.dart';
import 'package:oli/3_infrastructure/core/service/http_connection.dart';
import 'package:oli/3_infrastructure/question/local_question_repository.dart';
import 'package:oli/3_infrastructure/user/local_user_repository.dart';

Future<void> injectDependencies() async {
  // Infra
  Get.put<IAppRouter>(AppRouter(), permanent: true);
  Get.put<IConnection>(HttpConnection(), permanent: true);

  // Repositories
  Get.put<IUserRepository>(LocalUserRepository(), permanent: true);
  Get.put<IQuestionRepository>(LocalQuestionRepository(), permanent: true);

  // Global
  Get.put(GlobalController(), permanent: true);

  // Controllers (lazy to respect GetX lifecycle)
  Get.lazyPut(() => BottomNavBarController(), fenix: true);
}
