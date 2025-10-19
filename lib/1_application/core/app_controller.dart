import 'package:get/get.dart';
import 'package:oli/1_application/core/global_controller.dart';
import 'package:oli/1_application/core/router.dart';

abstract class AppController extends GetxController {
  final global = Get.find<GlobalController>();

  final _isInitLoading = true.obs;

  set isLoading(bool value) => global.isLoading.value = value;
  bool get isLoading => global.isLoading.value;

  bool get isInitLoading => _isInitLoading.value;

  IAppRouter get router => global.router;

  Future<bool> initLoading();

  @override
  Future<void> onInit() async {
    super.onInit();

    final initialLoadResult = await initLoading();
    _isInitLoading.value = false;
    if (!initialLoadResult) {
      global.pageInitLoadingFail();
    }
  }
}
