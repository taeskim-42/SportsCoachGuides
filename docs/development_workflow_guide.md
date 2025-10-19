# Development Workflow Guide

Flutter·Firebase 스택을 위한 필수 작업 흐름입니다. 모든 변경은 아래 절차를 통해 품질을 검증한 뒤 공유하세요.

## 🧭 베이스라인 워크플로 (필수)

1. **코드 품질 확인**
   ```bash
   dart format .              # 자동 포맷
   flutter analyze            # 정적 분석
   ```
   - 포맷/분석 경고가 0이 될 때까지 수정합니다.
   - lint 규칙은 `analysis_options.yaml`을 기준으로 합니다.

2. **단위·위젯 테스트**
   ```bash
   flutter test
   ```
   - 핵심 기능(상태 관리, 위젯, 유틸)은 최소 1개 이상 테스트를 유지합니다.
   - UI 변경 시 golden 테스트(`golden_toolkit`) 추가를 우선 고려합니다.

3. **로컬 실행 확인**
   ```bash
   flutter run -d chrome      # 웹
   flutter run -d ios|android # 필요 플랫폼
   ```
   - 주요 시나리오(네비게이션, 버튼, 데이터 흐름)를 직접 검증합니다.

4. **릴리즈 빌드 스모크**
   ```bash
   flutter build web          # 또는 build apk / ipa
   ```
   - 빌드 에러가 있으면 즉시 수정 후 반복합니다.

5. **Git 커밋 & 푸시**
   ```bash
   git status
   git add <files>
   git commit -m "feat: …"    # Conventional Commit 권장
   git push
   ```
   - 불필요한 파일이 스테이징되지 않았는지 확인합니다.

> 절대 `flutter analyze`나 `flutter build` 실패 상태로 커밋하지 않습니다.

## 🔁 브랜치 & PR 전략
- `main`은 항상 배포 가능한 상태를 유지합니다.
- 새로운 기능은 `feature/<scope>` 브랜치에서 작업합니다.
- PR에는 테스트 결과(명령어, 요약)를 포함합니다.
- 코드리뷰 전에는 최소 한 번 self-review (`git diff`)를 진행합니다.

## 🧪 테스트 가이드라인

| 구분 | 목적 | 명령 | 비고 |
| --- | --- | --- | --- |
| 단위 테스트 | 비즈니스 로직 검증 | `flutter test test/...` | Riverpod/UseCase/Util |
| 위젯 테스트 | UI 동작 확인 | `flutter test test/widgets/...` | Golden 포함 |
| 통합 테스트 | 실제 기기 플로우 | `flutter test integration_test` | 필요 시 Firebase Emulator 연동 |

- 테스트 디렉터리 구조는 실제 코드 구조를 미러링합니다.
- Firebase 연동 로직은 에뮬레이터 모드에서 검증 후 프로덕션에 연결합니다.

## ☁️ Firebase 워크플로

1. **에뮬레이터 사용**
   ```bash
   firebase emulators:start
   ```
   - Firestore/Functions/Storage 사용 시 로컬 환경에서 먼저 검증합니다.

2. **보안 규칙·인덱스 배포**
   ```bash
   firebase deploy --only firestore:rules
   firebase deploy --only firestore:indexes
   ```
   - 새 쿼리 작성 시 규칙 & 인덱스를 함께 업데이트합니다.

3. **Functions**
   ```bash
   cd functions
   npm run build
   firebase deploy --only functions
   ```
   - 배포 전 Cloud Functions 테스트(`npm test`)를 수행합니다.

## 🚀 배포 체크리스트

- [ ] `flutter analyze`/`flutter test` 통과
- [ ] 릴리즈 빌드 성공 (web/apk/ipa)
- [ ] Firebase 규칙·인덱스 최신 상태
- [ ] 앱 버전/빌드 번호 업데이트 (`pubspec.yaml`)
- [ ] 환경변수/Secret 설정 확인
- [ ] 성능·크래시 모니터링(FlutterFire Crashlytics 등) 계획

### 배포 명령 예시
```bash
flutter build web --release
firebase deploy --only hosting

flutter build apk --release
flutter install
```

## 🪲 디버깅 베스트 프랙티스

- **Flutter DevTools**: Widget Inspector, Performance, Network 탭을 기본 도구로 사용합니다.
- **로그링**: `dart:developer`의 `log` 또는 Riverpod logger를 활용하고 `print`는 지양합니다.
- **에러 위젯**: `ErrorWidget.builder`를 커스터마이즈해 프로덕션에서도 의미 있는 메시지를 노출합니다.
- **프로파일 빌드**: 렌더링/애니메이션 문제는 `flutter run --profile`로 확인합니다.
- **Firebase Functions**: `gcloud functions logs tail <name>`으로 실시간 로그를 추적합니다.

## ⚠️ 금지 패턴 & 주의 사항

- 임시 해결을 위해 `Future.delayed`, `setState` 연타, `SchedulerBinding.addPostFrameCallback` 남용 금지.
- Stateful 위젯에서 `initState`/`dispose` 책임을 명확히 하고, 리스너 해제 누락 금지.
- 비즈니스 로직은 프레젠테이션 레이어에 두지 말고 Provider/UseCase로 분리합니다.
- 디자인 토큰(`lib/theme/tokens.dart`) 이외 위치에서 색상·폰트 하드코딩 금지.
- Firebase 호출 시 항상 에러 처리·재시도 전략을 명시합니다.

## 📚 참고 자료
- Flutter 공식 문서: https://docs.flutter.dev
- FlutterFire 가이드: https://firebase.flutter.dev
- Apple HIG: https://developer.apple.com/design/human-interface-guidelines/
- Material 3: https://m3.material.io
- Firebase Emulator Suite: https://firebase.google.com/docs/emulator-suite

위 가이드는 디자인·Firebase 문서와 함께 유지 관리됩니다. 변경 사항이 생기면 반드시 해당 문서와 소스(테마, 테스트, 배포 스크립트)를 동기화하세요.

## 빌드 후 아래의 코드를 실행해 줘
flutter run -d 5CA23335-5381-4D16-A522-2DD52FEFDB2A