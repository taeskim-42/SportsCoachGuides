# Developer Action Items

이 문서는 현재 프로젝트에서 사용자(개발자)가 수행해야 할 다음 작업을 정리합니다. 모든 작업은 `docs/development_workflow_guide.md`와 `docs/firebase_development_guide.md`에 정의된 프로세스를 따르며, 완료 후 문서를 갱신하세요.

## 1. Firebase 연동 구현
- [ ] Firestore 컬렉션 구조(`users/{uid}/flashcards/{cardId}`, `questions/{questionId}`)를 실제 DB에 구성하고 초기 데이터 시드
  - [x] `firebase.json`, `.firebaserc`, `firestore.rules`, `firestore.indexes.json`, `storage.rules` 및 에뮬레이터 포트 스캐폴딩 추가 (2025-10-13)
  - [ ] 실제 Firebase 프로젝트 ID 연결 (`sportscoachguide-73aea`) 및 플랫폼 등록 (FlutterFire CLI) *(재실행 필요)*
  - [ ] 초기 데이터 시드 및 환경 분리 구성
    - 참고: `tools/firestore-seed` 디렉터리에 에뮬레이터/프로덕션 공용 시드 스크립트 추가 (2025-10-13)
- [ ] Cloud Functions `onFlashcardReview`, `onNewQuestionImport` 구현 및 에뮬레이터 테스트
  - [x] Functions(TypeScript) 프로젝트 뼈대 및 두 함수의 기본 핸들러 생성 (2025-10-13)
  - [ ] CSV 파이프라인/Spaced Repetition 세부 로직 구현 및 테스트
- [ ] Firebase Emulator Suite를 활용해 로컬 통합 테스트 실행 후 `firebase deploy --only firestore:rules,indexes` 준비

## 2. 인증 및 사용자 컨텍스트
- [ ] Firebase Auth(이메일/비밀번호) 기본 연동 및 초기화 *(UI/흐름 재구성이 필요함)*
- [ ] Riverpod 상태로 현재 사용자 ID 전달하고, `_demo-user` 하드코딩 제거
- [ ] 로그인/회원가입 화면을 디자인 시스템 가이드에 맞춰 구현
- [ ] 추가 OAuth 공급자 및 비밀번호 재설정 흐름 설계

## 3. UI 확장 및 데이터 연계
- [ ] 시험 종목/연도 선택 컴포넌트 구현 후 `selectedTrackProvider`, `selectedYearProvider`와 바인딩
- [ ] 대시보드 메트릭을 Firestore 실데이터 기반으로 계산하도록 리팩터링
- [ ] Spaced Repetition 플래시카드 화면(복습 큐)과 알림 플로우 구현

## 4. 품질 보증
- [x] `flutter analyze`, `flutter test`, `flutter build` CI 스크립트 작성 (GitHub Actions 권장) (2025-10-13)
- [ ] 골든 테스트 및 핵심 use case 단위 테스트 추가
- [ ] iOS/Android/웹에서 실기기 혹은 시뮬레이터로 스모크 테스트 수행

## 5. 문서 & 관리
- [ ] `docs/feature_spec.md` 진행 상황 업데이트 (버전, 변경 로그 포함)
- [ ] 환경 변수/Secret 관리 문서화 (Firebase, YouTube API)
- [ ] 다음 스프린트를 위한 백로그 정리 후 `developer_action_items.md` 업데이트

> 각 작업 완료 후 체크박스를 갱신하고 관련 커밋 메시지에 명시하세요. 필요한 추가 작업이 생기면 섹션을 확장하거나 새 섹션을 추가해 관리합니다.
