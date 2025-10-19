import 'package:oli/1_application/splash/splash_page_controller.dart';
import 'package:get/get.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}
