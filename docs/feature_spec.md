# 📘 Feature Specification
### 제품명: **생활체육지도자 시험 준비 앱 (MVP)**
**문서 버전:** v0.1.1  
**작성자:** GPT-5 + [Your Name]  
**작성일:** 2025-10-12  
**마지막 수정:** 2025-10-12

## 1. Product Overview
- **Vision**  
  생활체육지도자 자격시험 응시생이 언제 어디서나 효율적으로 학습할 수 있는 개인 맞춤형 모바일 학습 플랫폼을 제공한다.  
  장기적으로는 자격 취득 이후 실습, 커뮤니티, 경력관리까지 아우르는 “생활체육지도자 생애주기 플랫폼”으로 확장한다.

- **Primary Users**
  - 자격시험 응시자 (체육 전공자, 예비 지도자)
  - 재응시생 및 자격 갱신자
  - 학원 강사 / 시험 준비 코치

- **Value Proposition**
  - 스마트폰 기반의 **언제 어디서나 학습 환경**
  - **연도별 기출문제 + 해설 + 유튜브 영상** 연계
  - **Space Repetition 기반 플래시카드 복습 시스템**
  - 오답 및 진도 자동 관리

## 2. Personas & Journeys
### Persona A — “민지”, 27세, 체육학과 졸업생  
- **목표:** 생활체육지도자 2급 자격 취득  
- **Pain Points:**  
  - 문제풀이 자료가 흩어져 있고, 모바일에서 보기 불편함  
  - 어떤 문제를 다시 복습해야 할지 감이 없음  
  - 실기/구술 대비 영상 자료 찾기 어려움  
- **Needs:**  
  - 모바일 기반 문제풀이 + 해설  
  - 자동 오답관리 + 반복 복습 시스템  
  - 신뢰할 수 있는 학습 영상 연결

### User Journey Map
1. 앱 로그인 / 회원가입  
2. 종목 선택 (예: 축구, 배드민턴 등)  
3. 연도별 기출문제 선택  
4. 문제 풀이 & 해설 확인  
5. 오답 → 플래시카드 저장  
6. Space Repetition 스케줄에 따라 복습 알림  
7. 관련 유튜브 풀이 영상 학습  
8. 점수·진도 대시보드 확인  

## 3. Release Scope & Priorities
| 기능 | 설명 | 우선순위 | 타깃 릴리즈 |
|------|------|-----------|---------------|
| 문제풀이 모듈 | 연도별 문제, 선택지, 정답/해설 | High | MVP |
| 플래시카드 저장 | 오답 및 중요문항 저장 | High | MVP |
| Space Repetition 알고리즘 | 복습 주기 자동 스케줄링 | High | MVP+1 |
| 유튜브 영상 연동 | 문제별 관련 풀이 영상 연결 | Medium | MVP |
| 개인 진도 대시보드 | 풀이 진척도 및 취약분석 | Medium | MVP+1 |
| 로그인/계정 관리 | Firebase Auth 기반 | High | MVP |
| 푸시 알림 | 복습 리마인더, 공지 | Low | 이후 |

## 4. Core Features
### 4.1 문제풀이 모듈
- **목표:** 연도별 기출문제를 모바일 환경에서 효율적으로 풀 수 있게 한다.  
- **시나리오:**  
  사용자가 종목과 연도를 선택 → 문제 리스트 출력 → 선택지 선택 → 정답 확인 및 해설 표시  
- **성공 조건:** 문제풀이 UI 오류 없이 작동, 채점·저장 기능 정상 작동  
- **KPI:** 1회 평균 문제풀이 완수율 ≥ 80%

### 4.2 플래시카드 저장 & 복습
- **목표:** 사용자의 오답·중요문항을 자동으로 저장하고, Spaced Repetition으로 재학습을 유도  
- **시나리오:**  
  - 사용자가 “복습카드로 저장” 클릭  
  - 앱은 Firestore의 `users/{uid}/flashcards/{cardId}`에 카드 데이터 저장  
  - Space Repetition 알고리즘(Factor, Ease, Interval) 기반으로 복습일 계산  
  - 지정된 날짜에 복습 알림 제공  
- **성공 조건:** 카드 저장·복습 스케줄링 정확성, 사용자 재방문율 향상  
- **KPI:** 평균 복습률 ≥ 60%, 일일 활성 사용자 수(DAU) 증가

### 4.3 유튜브 풀이 영상 연동
- **목표:** 개념 이해 및 실기 대비를 위한 영상 학습 기능 제공  
- **시나리오:**  
  - 문제에 연결된 유튜브 링크 제공  
  - 인앱 플레이어 또는 외부 앱으로 영상 재생  
- **성공 조건:** 영상 로드 성공률 ≥ 99%  
- **KPI:** 평균 시청 유지시간 ≥ 60초

## 5. Data Model Requirements
### Firestore Collections
users/{uid}  
  - name: string
  - email: string
  - role: string ("student", "coach")
  - createdAt: timestamp
  - track: string (선택한 종목)
  - lastLoginAt: timestamp

questions/{questionId}  
  - year: number
  - subject: string
  - questionText: string
  - options: array[string]
  - answer: string
  - explanation: string
  - youtubeLink: string (optional)
  - tags: array[string]
  - updatedAt: timestamp

users/{uid}/flashcards/{cardId}  
  - questionId: string
  - nextReview: timestamp
  - easeFactor: number
  - intervalDays: number
  - lastReviewed: timestamp
  - performance: string ("good" | "hard" | "again")
  - createdAt: timestamp

### Cloud Functions
- **onFlashcardReview** (`functions.firestore.document('users/{uid}/flashcards/{cardId}')`)  
  - Trigger: onUpdate  
  - Logic: 사용자의 평가 결과에 따라 `easeFactor`, `intervalDays`, `nextReview` 계산 (SM-2 기본값 + 커스텀 파라미터)  
  - Retry & Error: 실패 시 Dead Letter Queue(Log) 기록 후 사용자 재시도 요청  

- **onNewQuestionImport** (`functions.storage.object().onFinalize`)  
  - Trigger: Cloud Storage `imports/questions/*.csv` 업로드 완료  
  - Logic: CSV 파싱 → `questions` 컬렉션에 배치 쓰기 → 필요한 경우 인덱스 생성 요청  
  - Error Handling: 실패 시 Slack/Webhook 알림 + 재처리 큐 적재

### 외부 API 연동
- YouTube Data API v3
  - 인증: API Key  
  - 호출 빈도: 문제별 최초 요청 시 1회 (영상 캐시 저장)  
  - 오류 처리: video not found → “연결된 영상 없음” 표시  

## 6. UI / UX Notes
- 스크린 목록
  1. 로그인 / 회원가입  
  2. 문제 목록  
  3. 문제풀이 화면 (정답/해설 탭 구조)  
  4. 플래시카드 복습 화면  
  5. 진도 대시보드  

- 디자인 토큰
  - 기본 팔레트: `docs/design_system_guide.md`의 다크 테마(BMW Night, BMW Blue, MINI Accent) 준수  
  - 학습 브랜드 변형이 필요할 경우 토큰 확장(`AppColorScheme.studyMode`)으로 관리  
  - 폰트: 기본 `Inter`/`SF Pro` + 한글 보완용 `Noto Sans KR` 서브셋

- 반응형 고려: 모바일 우선, 태블릿 대응  
- 접근성: 텍스트 대비 4.5:1 이상, TTS 지원 고려  

## 7. Non-Functional Requirements
- 성능: 문제 로딩 < 1.5초 / 화면 전환 < 500ms  
- 보안: Firebase Auth + HTTPS / Firestore Rules 적용  
- 로깅: Firebase Analytics + Crashlytics  
- 운영: dev / stage / prod 환경 분리, GitHub Actions 기반 CI/CD  

## 8. Open Questions / Risks
- KSPO 문제 데이터의 저작권 범위 및 API 제공 여부  
- 유튜브 영상 연동 시 공식/비공식 콘텐츠 구분 기준  
- Space Repetition 알고리즘의 세부 파라미터 (SM-2 vs custom)  
- 향후 iOS / Android 동시 개발 여부 (Flutter 권장)

## 9. Approval & History
- 문서 버전: v0.1.1  
- 작성자: [당신 이름]  
- 리뷰어: —  
- 승인자: —  
- 변경 로그:  
  - 2025-10-12: Firestore 구조/함수 상세, 디자인 토큰 정합성 업데이트  
  - 2025-10-12: 최초 작성 (시험 준비 지원 앱 MVP 스펙 초안)
