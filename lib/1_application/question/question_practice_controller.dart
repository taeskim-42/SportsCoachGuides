import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oli/1_application/core/app_controller.dart';
import 'package:oli/2_domain/question/i_question_repository.dart';
import 'package:oli/2_domain/question/question.dart';

class QuestionPracticeController extends AppController {
  QuestionPracticeController()
      : _questionRepository = Get.find<IQuestionRepository>();

  final IQuestionRepository _questionRepository;

  final List<String> tracks = const ['축구', '배드민턴', '수영'];
  final List<int> years = const [2024, 2023, 2022];

  final _selectedTrack = '축구'.obs;
  final _selectedYear = 2024.obs;
  final RxList<Question> _questions = <Question>[].obs;
  final RxSet<String> _flashcardQuestionIds = <String>{}.obs;
  final RxMap<String, String> _selectedOptions = <String, String>{}.obs;
  final RxSet<String> _expandedQuestionIds = <String>{}.obs;
  final _errorMessage = RxnString();

  String get selectedTrack => _selectedTrack.value;
  int get selectedYear => _selectedYear.value;
  List<Question> get questions => _questions;
  String? get errorMessage => _errorMessage.value;

  String? selectedOptionFor(String questionId) =>
      _selectedOptions[questionId];

  bool isFlashcard(String questionId) =>
      _flashcardQuestionIds.contains(questionId);

  bool isExpanded(String questionId) =>
      _expandedQuestionIds.contains(questionId);

  @override
  Future<bool> initLoading() async {
    return _loadQuestions(track: selectedTrack, year: selectedYear);
  }

  Future<void> selectTrack(String track) async {
    if (_selectedTrack.value == track) {
      return;
    }
    _selectedTrack.value = track;
    await _loadQuestions(track: track, year: _selectedYear.value);
  }

  Future<void> selectYear(int year) async {
    if (_selectedYear.value == year) {
      return;
    }
    _selectedYear.value = year;
    await _loadQuestions(track: _selectedTrack.value, year: year);
  }

  Future<bool> _loadQuestions({required String track, required int year}) async {
    isLoading = true;
    _errorMessage.value = null;
    final Either<String, List<Question>> result =
        await _questionRepository.fetchQuestions(track: track, year: year);
    return result.fold((error) {
      _questions.clear();
      _errorMessage.value = error;
      isLoading = false;
      return false;
    }, (data) {
      _questions.assignAll(data);
      _selectedOptions.clear();
      _expandedQuestionIds.clear();
      isLoading = false;
      return true;
    });
  }

  void toggleFlashcard(String questionId) {
    if (_flashcardQuestionIds.contains(questionId)) {
      _flashcardQuestionIds.remove(questionId);
    } else {
      _flashcardQuestionIds.add(questionId);
    }
    _flashcardQuestionIds.refresh();
  }

  void chooseOption({required String questionId, required String option}) {
    _selectedOptions[questionId] = option;
    _selectedOptions.refresh();
  }

  void toggleExplanation(String questionId) {
    if (_expandedQuestionIds.contains(questionId)) {
      _expandedQuestionIds.remove(questionId);
    } else {
      _expandedQuestionIds.add(questionId);
    }
    _expandedQuestionIds.refresh();
  }
}
