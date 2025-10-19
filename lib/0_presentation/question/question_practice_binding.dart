import 'package:get/get.dart';
import 'package:oli/1_application/question/question_practice_controller.dart';

class QuestionPracticeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestionPracticeController());
  }
}
