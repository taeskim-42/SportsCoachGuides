import 'package:get/get.dart';
import 'package:oli/1_application/preview/model/flashcard_preview.dart';
import 'package:oli/1_application/preview/model/progress_metric.dart';
import 'package:oli/1_application/preview/model/question_preview.dart';
import 'package:oli/1_application/preview/model/youtube_resource.dart';

class FeaturePreviewController extends GetxController {
  FeaturePreviewController();

  final RxInt currentIndex = 0.obs;

  final RxString selectedTrack = '축구'.obs;
  final RxInt selectedYear = 2024.obs;
  final RxString selectedQuestionId = 'q-2024-01'.obs;

  late final List<QuestionPreview> _questions;
  late final List<FlashcardPreview> flashcards;
  late final List<ProgressMetric> metrics;
  late final List<YoutubeResource> youtubeResources;

  List<String> get availableTracks => {
        for (final q in _questions) q.track,
      }.toList()
        ..sort();

  List<int> get availableYears => {
        for (final q in _questions) q.year,
      }.toList()
        ..sort((a, b) => b.compareTo(a));

  @override
  void onInit() {
    super.onInit();
    _questions = _buildSampleQuestions();
    flashcards = _buildSampleFlashcards();
    metrics = _buildSampleMetrics();
    youtubeResources = _buildYoutubeResources();
  }

  void onNavIndexChanged(int index) {
    currentIndex.value = index;
  }

  void onTrackSelected(String track) {
    selectedTrack.value = track;
    _ensureSelectedQuestionIsVisible();
  }

  void onYearSelected(int year) {
    selectedYear.value = year;
    _ensureSelectedQuestionIsVisible();
  }

  void onQuestionSelected(String questionId) {
    selectedQuestionId.value = questionId;
  }

  QuestionPreview? get selectedQuestion {
    return filteredQuestions
        .where((question) => question.id == selectedQuestionId.value)
        .firstOrNull;
  }

  List<QuestionPreview> get filteredQuestions {
    return _questions
        .where((question) =>
            question.track == selectedTrack.value &&
            question.year == selectedYear.value)
        .toList();
  }

  double get completenessScore {
    return switch (currentIndex.value) {
      0 => 0.8,
      1 => 0.9,
      2 => 0.75,
      3 => 0.6,
      _ => 0.0,
    };
  }

  void _ensureSelectedQuestionIsVisible() {
    final visibleIds = filteredQuestions.map((q) => q.id);
    if (!visibleIds.contains(selectedQuestionId.value) &&
        filteredQuestions.isNotEmpty) {
      selectedQuestionId.value = filteredQuestions.first.id;
    }
  }

  List<QuestionPreview> _buildSampleQuestions() {
    return const [
      QuestionPreview(
        id: 'q-2024-01',
        year: 2024,
        track: '축구',
        subject: '운동생리학',
        question:
            '고강도 인터벌 트레이닝(HIIT)이 생활체육지도자 2급 필기 시험에서 강조하는 체력 요소는 무엇이며, 해당 세션의 적정 휴식 비율은?',
        options: [
          '근지구력, 1:1 휴식',
          '무산소 파워, 1:2 휴식',
          '유산소 지구력, 1:0.5 휴식',
          '순발력, 1:4 휴식',
        ],
        answerIndex: 1,
        explanation:
            '생활체육지도자 2급에서 강조하는 HIIT 구성은 무산소 파워 향상과 젖산 역치 훈련을 위해 1:2 (운동:휴식) 비율을 권장합니다. 운동 강도는 HRmax 90% 이상, 휴식은 완전 휴식 또는 저강도 조깅을 제안합니다.',
        youtubeVideoId: 'dQw4w9WgXcQ',
        tags: ['HIIT', '무산소', '트레이닝 이론'],
        correctRate: 0.64,
        isBookmarked: true,
        isSolved: true,
      ),
      QuestionPreview(
        id: 'q-2024-02',
        year: 2024,
        track: '축구',
        subject: '스포츠 심리',
        question:
            '메ンタルト레이닝 중 자기대화(self-talk)를 적용할 때, 경기 전 루틴 설계의 핵심 단계는 무엇인가?',
        options: [
          '긍정 명령어 작성 → 시각화 → 호흡',
          '호흡 → 시각화 → 긍정 명령어 작성',
          '시각화 → 긍정 명령어 작성 → 루틴 리허설',
          '호흡 → 긍정 명령어 작성 → 루틴 리허설',
        ],
        answerIndex: 3,
        explanation:
            '생활체육지도자 출제 가이드에서는 호흡으로 긴장을 낮춘 뒤, 긍정 명령어로 주의 집중을 유도하고, 실제 루틴을 리허설하는 순서를 권장합니다.',
        youtubeVideoId: '5NV6Rdv1a3I',
        tags: ['심리기술훈련', '자기대화', '루틴'],
        correctRate: 0.52,
        isBookmarked: false,
        isSolved: false,
      ),
      QuestionPreview(
        id: 'q-2023-03',
        year: 2023,
        track: '축구',
        subject: '운동역학',
        question:
            '스텝 킥 동작에서 지면반력(GRF) 벡터의 방향이 공에 전달되는 속도에 미치는 영향으로 옳은 것은?',
        options: [
          '지면반력 방향이 신체 중심선과 일치할수록 공 속도는 감소한다.',
          '지면반력 벡터가 전방 10~15° 기울어질 때 속도가 극대화된다.',
          '지면반력 벡터가 수직일 때 각속도가 극대화된다.',
          '지면반력 크기는 속도와 무관하며 균형 유지에만 기여한다.',
        ],
        answerIndex: 1,
        explanation:
            '킥 동작에서는 전방으로 기울어진 GRF가 추진력을 제공하여 공의 초기 속도를 높입니다. 10~15° 범위가 동작 안정성과 추진력 사이의 최적점으로 알려져 있습니다.',
        youtubeVideoId: 'q6EoRBvdVPQ',
        tags: ['운동역학', '지면반력', '킥'],
        correctRate: 0.47,
        isBookmarked: true,
        isSolved: false,
      ),
      QuestionPreview(
        id: 'q-2024-04',
        year: 2024,
        track: '배드민턴',
        subject: '운동생리학',
        question:
            '배드민턴 경기 중 인터벌 훈련 설계 시 젖산 역치(LT)를 활용하는 방법으로 옳은 것은?',
        options: [
          'LT + 20% 강도로 3분 지속, 30초 휴식 반복',
          'LT - 10% 강도로 8분 지속, 1분 휴식 반복',
          'LT 수준 강도로 5분 지속, 5분 휴식 반복',
          'LT + 5% 강도로 90초 지속, 90초 휴식 반복',
        ],
        answerIndex: 3,
        explanation:
            '생활체육지도자 배드민턴 종목에서는 LT를 약간 초과하는 강도로 짧은 구간 반복을 권장합니다. 90초/90초 패턴은 코트 전환 속도와 유사하여 현장 적용성이 높습니다.',
        youtubeVideoId: 'sBws8MSXN7A',
        tags: ['배드민턴', 'LT', '인터벌'],
        correctRate: 0.58,
        isBookmarked: false,
        isSolved: true,
      ),
      QuestionPreview(
        id: 'q-2023-05',
        year: 2023,
        track: '배드민턴',
        subject: '스포츠 윤리',
        question:
            '생활체육지도자가 학생선수의 학습권을 보장하기 위해 마련해야 하는 절차로 가장 적절한 것은?',
        options: [
          '학습 계획을 작성하고 보호자와 분기별로 공유한다.',
          '선수 본인이 학습 계획을 작성하고 지도자는 확인만 한다.',
          '학습보다는 훈련을 우선하며, 학습은 방학 중 집중 편성한다.',
          '주 1회 온라인 수업을 수강하도록 안내한다.',
        ],
        answerIndex: 0,
        explanation:
            '교육부 지침에 따라 생활체육지도자는 학습 계획을 수립하고 보호자와 정기적으로 공유하여 학습권을 보장해야 합니다.',
        youtubeVideoId: 'tAGnKpE4NCI',
        tags: ['윤리', '학습권', '지도자 역할'],
        correctRate: 0.83,
        isBookmarked: true,
        isSolved: true,
      ),
    ];
  }

  List<FlashcardPreview> _buildSampleFlashcards() {
    return const [
      FlashcardPreview(
        id: 'fc-001',
        title: '에너지 시스템 전환',
        prompt:
            '30초 올아웃 스프린트 후 90초 휴식 패턴에서 우세한 에너지 시스템과 회복 전략은?',
        answer:
            '초반에는 인산화 시스템이 우세하고, 15초 이후 젖산에 의한 무산소 해당이 주요 에너지원이 됩니다. 회복기에는 유산소 기반의 젖산 제거를 위해 가벼운 조깅과 호흡 조절을 안내합니다.',
        nextReviewLabel: '오늘 (D0)',
        easeFactor: 2.5,
        intervalDays: 6,
        status: FlashcardStatus.review,
      ),
      FlashcardPreview(
        id: 'fc-002',
        title: '멘탈 루틴 구성 3단계',
        prompt: '호흡 → 긍정 명령어 → 루틴 리허설 순서의 목적은?',
        answer:
            '호흡으로 생리적 긴장을 낮추고, 긍정 명령어로 주의 집중을 고정한 후, 루틴 리허설로 상황 대응을 자동화합니다.',
        nextReviewLabel: '내일 (D1)',
        easeFactor: 2.8,
        intervalDays: 10,
        status: FlashcardStatus.learning,
      ),
      FlashcardPreview(
        id: 'fc-003',
        title: '배드민턴 LT 훈련',
        prompt: 'LT + 5% 강도로 90초 반복 시 체크해야 할 생리 지표는?',
        answer:
            '심박수와 RPE(자각적 운동 강도), 젖산 수치를 3세트 간격으로 측정하여 과도한 피로 누적을 방지합니다.',
        nextReviewLabel: '3일 후 (D3)',
        easeFactor: 2.2,
        intervalDays: 4,
        status: FlashcardStatus.scheduled,
      ),
    ];
  }

  List<ProgressMetric> _buildSampleMetrics() {
    return const [
      ProgressMetric(
        id: 'metric-accuracy',
        title: '최근 7일 정답률',
        description: '문제풀이 42문항 중 33문항 정답',
        value: 0.79,
        targetLabel: '목표 0.85',
        type: ProgressMetricType.ratio,
      ),
      ProgressMetric(
        id: 'metric-coverage',
        title: '연도별 커버리지',
        description: '2024년 풀이율 68%',
        value: 0.68,
        targetLabel: '목표 0.90',
        type: ProgressMetricType.progress,
      ),
      ProgressMetric(
        id: 'metric-flashcards',
        title: '플래시카드 복습 준수율',
        description: '지난 주 예정 카드 18장 중 16장 완료',
        value: 0.89,
        targetLabel: '목표 0.90',
        type: ProgressMetricType.ratio,
      ),
    ];
  }

  List<YoutubeResource> _buildYoutubeResources() {
    return const [
      YoutubeResource(
        id: 'yt-001',
        title: 'HIIT 설계 마스터클래스 (생활체육지도자 대비)',
        channelName: '스포츠과학랩',
        duration: '12:41',
        url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        relatedQuestionId: 'q-2024-01',
      ),
      YoutubeResource(
        id: 'yt-002',
        title: '멘탈 루틴 3단계 실습',
        channelName: '멘탈피트니스',
        duration: '08:52',
        url: 'https://www.youtube.com/watch?v=5NV6Rdv1a3I',
        relatedQuestionId: 'q-2024-02',
      ),
      YoutubeResource(
        id: 'yt-003',
        title: '배드민턴 LT 인터벌 실전 적용법',
        channelName: '코치의 서재',
        duration: '15:07',
        url: 'https://www.youtube.com/watch?v=sBws8MSXN7A',
        relatedQuestionId: 'q-2024-04',
      ),
    ];
  }
}
