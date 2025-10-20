# Firebase Project Setup (sportscoachguide-73aea)

FlutterFire CLI generated Firebase app registrations and configuration for the following platforms:

| Platform | App ID | Notes |
| --- | --- | --- |
| Android | `1:481834699247:android:25e739c887f4c93e554e1a` | Package: `com.example.sports_coach_guide` (update as needed) |
| iOS | `1:481834699247:ios:eccaf4263e5b1599554e1a` | Bundle: `com.example.sportsCoachGuide` (change in Xcode) |
| Web | `1:481834699247:web:239a5bde2edbdb10554e1a` | Auto-registered |

Generated files & placeholders:
- `lib/firebase_options.dart` (sanitized template – replace values locally before running the app)
- Sample service manifests: `android/app/google-services.json.sample`, `ios/Runner/GoogleService-Info.plist.sample`
- Updated platform config under `android/`, `ios/`, and `web/`
- Remember to download the official `google-services.json` and `GoogleService-Info.plist` from the Firebase console after setting the final package IDs. Store the real files outside of Git or keep them ignored so secrets never leak.

## 구성 현황 (2025-10-14)

- ✅ `lib/firebase_options.dart`  
  - 현재 저장소에는 민감 정보를 비워 둔 플레이스홀더가 포함되어 있습니다. 실제 값은 `flutterfire configure --project=sportscoachguide-73aea --platforms=ios,android,web` 명령으로 재생성한 뒤, 안전한 방법으로 배포하세요.
- ⚠️ `ios/Runner/GoogleService-Info.plist` (환경별)
  - Firebase Console에서 내려받아야 합니다. 저장소에는 참고용 샘플(`ios/Runner/GoogleService-Info.plist.sample`)만 존재합니다.
- ⚠️ `android/app/google-services.json`
  - 동일하게 Console에서 내려받아야 하며, 저장소에는 샘플(`android/app/google-services.json.sample`)만 포함되어 있습니다.
- ✅ `.firebaserc`, `firebase.json`, `firestore.rules`, `firestore.indexes.json`, `storage.rules`  
  - 에뮬레이터 포트 구성과 기본 보안 룰/인덱스를 복구했습니다. 필요 시 동일 디렉터리에서 수정 후 `firebase deploy --only firestore:rules,indexes`를 실행하세요.

> ⚠️ Firebase 서비스 파일(Plist/JSON)과 `firebase_options.dart`는 개인 자격 증명입니다. 현재 저장소에는 빈 값이 포함된 템플릿만 존재하며, 실제 값을 주입한 버전은 `.gitignore`에 의해 추적되지 않도록 유지하세요.

## Auth & Firestore integration status

- [x] Dependencies (`firebase_core`, `firebase_auth`, `cloud_firestore`) 추가 완료 (`pubspec.yaml`)
- [x] `Firebase.initializeApp` 초기화 로직 복원 완료 (`lib/main.dart`)
- [ ] AuthGate/Firestore 데이터 흐름 위젯 재구현 필요
- [ ] Firestore 초기 시드 데이터 적용 (`tools/firestore-seed`)

Next steps:
1. Update Bundle ID / Android `applicationId` to production values, then re-run `flutterfire configure` if changed.
2. Regenerate `lib/firebase_options.dart` with the FlutterFire CLI and inject the real credentials locally (never commit secrets).
3. Replace service files with production credentials from the Firebase console and keep them out of public repos (use secrets/CI vaults).
4. Ensure CI/CD caches the `.pub-cache/bin` or installs FlutterFire CLI for future runs.
5. Follow `docs/firebase_development_guide.md` for rules deployment and emulator usage.
