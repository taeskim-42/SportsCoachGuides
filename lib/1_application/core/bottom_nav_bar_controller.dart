import 'package:get/get.dart';
import 'package:oli/1_application/core/app_controller.dart';

class BottomNavBarController extends AppController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  set currentIndex(int newIndex) {
    _currentIndex.value = newIndex;
    if (newIndex == 0) {
      router.toDiagnosisOffAll();
    } else if (newIndex == 1) {
      router.toCommunityOffAll();
    } else if (newIndex == 2) {
      router.toProfileOffAll();
    } else {
      throw 'wrong index';
    }
  }

  set justChangeIndex(int newIndex) {
    _currentIndex.value = newIndex;
  }

  @override
  Future<bool> initLoading() async {
    return true;
  }
}
