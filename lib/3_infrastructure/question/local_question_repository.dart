import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:oli/2_domain/question/i_question_repository.dart';
import 'package:oli/2_domain/question/question.dart';

class LocalQuestionRepository implements IQuestionRepository {
  LocalQuestionRepository();

  static final List<Question> _questions = [
    const Question(
      id: 'soccer-2024-01',
      year: 2024,
      track: '축구',
      subject: '전술 이해',
      questionText:
          '하프라인에서 시작하는 역습 상황에서 3선 미드필더의 가장 적절한 움직임은 무엇인가요?',
      options: [
        '즉시 전방으로 롱패스를 시도한다.',
        '사이드 라인으로 벌려 수비를 끌어낸다.',
        '침투하는 윙어를 향해 스루 패스를 준비한다.',
        '공을 잡고 있는 선수 뒤에서 커버를 준비한다.',
      ],
      answer: '침투하는 윙어를 향해 스루 패스를 준비한다.',
      explanation:
          '생활체육지도자 시험 가이드에서는 역습 상황에서의 빠른 전환과 지원 플레이를 강조합니다. 침투하는 윙어를 지원하는 스루 패스 준비가 가장 높은 득점 기대값을 만듭니다.',
      youtubeLink: 'https://youtu.be/example_soccer_counter',
      tags: ['역습', '전술'],
    ),
    const Question(
      id: 'soccer-2023-02',
      year: 2023,
      track: '축구',
      subject: '체력 훈련',
      questionText:
          '인터벌 트레이닝을 8주 프로그램으로 설계할 때 주당 세션 수와 강도 조절의 기본 원칙은 무엇인가요?',
      options: [
        '주당 1회, 최대심박수 70% 유지',
        '주당 2회, 최대심박수 80~90% 반복',
        '주당 4회, 최대심박수 60% 고정',
        '주당 5회, 최대심박수 95% 유지',
      ],
      answer: '주당 2회, 최대심박수 80~90% 반복',
      explanation:
          '공식 가이드라인에 따르면 생활체육지도자의 체력 훈련 설계 시 인터벌은 주당 2회, 80~90% HRmax를 반복하며 회복 시간을 충분히 확보해야 합니다.',
      tags: ['체력', '프로그램'],
    ),
    const Question(
      id: 'badminton-2024-01',
      year: 2024,
      track: '배드민턴',
      subject: '기술 분석',
      questionText:
          '드롭 샷을 활용한 수비 전환 시 상대의 공격 패턴을 빠르게 파악하기 위한 핵심 포인트는 무엇인가요?',
      options: [
        '셔틀콕의 회전을 확인한다.',
        '상대 라켓의 각도와 스텝을 동시에 관찰한다.',
        '네트 앞 공간으로 미리 전진한다.',
        '백코트로 빠르게 후퇴한다.',
      ],
      answer: '상대 라켓의 각도와 스텝을 동시에 관찰한다.',
      explanation:
          '드롭 샷 이후에는 상대의 라켓 각도와 스텝이 다음 공격을 예측하는 가장 신뢰도 높은 지표로 제시됩니다. 해당 정보는 docs/feature_spec.md의 기술 분석 항목과 일치합니다.',
      youtubeLink: 'https://youtu.be/example_badminton_drop',
      tags: ['드롭샷', '전술 분석'],
    ),
    const Question(
      id: 'swim-2022-01',
      year: 2022,
      track: '수영',
      subject: '생리학',
      questionText:
          '장거리 자유형 훈련에서 젖산 역치(LT)를 향상시키기 위한 대표적인 세트 구성은 무엇인가요?',
      options: [
        '50m × 10세트, 전력 질주',
        '200m × 5세트, LT 속도 유지, 세트 간 30초 휴식',
        '400m × 2세트, 편안한 호흡 유지',
        '25m × 12세트, 비복근 강화',
      ],
      answer: '200m × 5세트, LT 속도 유지, 세트 간 30초 휴식',
      explanation:
          'docs/feature_spec.md의 체력 프로그램 가이드에 따라 젖산 역치는 지속적인 중강도 반복과 짧은 휴식으로 향상됩니다.',
      tags: ['LT', '프로그래밍'],
    ),
  ];

  @override
  Future<Either<String, List<Question>>> fetchQuestions({
    required String track,
    required int year,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    final filtered = _questions
        .where((question) => question.track == track && question.year == year)
        .toList();
    if (filtered.isEmpty) {
      return left('선택한 조건에 해당하는 문제가 아직 등록되지 않았습니다.');
    }
    return right(filtered);
  }
}
