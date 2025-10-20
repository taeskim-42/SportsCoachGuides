import 'package:get/get.dart';
import 'package:oli/1_application/preview/feature_preview_controller.dart';

class FeaturePreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturePreviewController>(() => FeaturePreviewController());
  }
}
