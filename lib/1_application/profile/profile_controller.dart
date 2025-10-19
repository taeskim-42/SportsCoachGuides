import 'package:get/get.dart';
import 'package:oli/1_application/core/app_controller.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:oli/2_domain/user/user.dart';

class ProfileController extends AppController {
  ProfileController() : _globalController = Get.find<GlobalController>();

  final GlobalController _globalController;

  Rx<User> get user => _globalController.userRx;

  @override
  Future<bool> initLoading() async {
    return true;
  }
}
