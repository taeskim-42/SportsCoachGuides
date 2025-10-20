import 'package:get/get.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:oli/1_application/core/router.dart';
import 'package:oli/2_domain/core/i_connection.dart';
import 'package:oli/2_domain/user/i_user_repository.dart';
import 'package:oli/3_infrastructure/core/mock_connection.dart';
import 'package:oli/3_infrastructure/core/mock_user_repository.dart';

Future<void> injectDependencies() async {
  Get
    ..put<IAppRouter>(AppRouter(), permanent: true)
    ..put<IConnection>(MockConnection(), permanent: true)
    ..put<IUserRepository>(MockUserRepository(), permanent: true)
    ..put(GlobalController(), permanent: true);
}
