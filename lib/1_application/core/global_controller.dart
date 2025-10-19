import 'package:get/get.dart';
import 'package:oli/1_application/core/router.dart';
import 'package:oli/2_domain/core/i_connection.dart';
import 'package:oli/2_domain/user/i_user_repository.dart';
import 'package:oli/2_domain/user/user.dart';

class GlobalController extends GetxController {
  final router = Get.find<IAppRouter>();
  final _connection = Get.find<IConnection>();
  final _userRepo = Get.find<IUserRepository>();

  // global values
  final _user = User.empty().obs;

  // isLoading
  final isLoading = false.obs;

  Future<void> tryLogin() async {
    if (_user.value != User.empty()) {
      _connection.setCallback(401, () => router.toSplashOffAll());
      router.toDiagnosisOffAll();
      return;
    }
    final ret = await _userRepo.getCurrent();
    return ret.fold(
      (l) => router.toSignInOffAll(),
      (r) {
        _user.value = r;
        _connection.setCallback(401, () => router.toSplashOffAll());
      },
    );
  }

  void pageInitLoadingFail() {
    // print('page init loading page...');
  }
}
