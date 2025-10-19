import 'package:get/get.dart';
import 'package:oli/1_application/community/community_controller.dart';

class CommunityBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CommunityController());
  }
}
