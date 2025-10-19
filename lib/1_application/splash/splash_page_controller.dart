import 'package:oli/1_application/core/app_controller.dart';

class SplashPageController extends AppController {
  Future<void> _checkLoginState() async {
    global.tryLogin();
  }

  @override
  Future<bool> initLoading() async {
    Future.delayed(const Duration(seconds: 0), _checkLoginState);
    return true;
  }
}
