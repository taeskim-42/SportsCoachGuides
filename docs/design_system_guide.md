# Flutter Design System Guide

Apple의 Human Interface Guidelines(HIG)에서 강조하는 **Clarity · Deference · Depth**와 BMW·MINI Connected 앱이 보여주는 **프리미엄, 모던, 운전자 중심** 감성을 결합한 Flutter 전용 디자인 시스템입니다. 아래 원칙을 통해 iOS·Android·웹에서 일관된 고품질 경험을 제공합니다.

## 핵심 디자인 원칙
- **명확함**: 정보 계층과 타이포그래피 대비를 분명히 하여 사용자가 즉시 이해할 수 있도록 합니다.
- **맥락 존중**: 콘텐츠가 주인공이 되도록 하고, 크롬(Chrome)은 최소화합니다. 불필요한 테두리·그림자를 줄이고 공간과 타이포그래피로 구분합니다.
- **입체감과 몰입**: BMW·MINI의 정갈한 다크 테마와 포커스 색을 활용해 깊이를 부여하되, Flutter의 다중 플랫폼 특성을 고려해 과도한 글로우/그라데이션은 지양합니다.
- **일관된 모션**: iOS는 자연스러운 가속/감속, Android는 Material 3의 모션 곡선을 따릅니다. 두 플랫폼 모두에서 어설픈 타협 없이 자연스러운 인터랙션을 구현합니다.
- **적응형 화면**: 다양한 폼팩터(모바일, 태블릿, 데스크톱)에 맞춰 자동으로 대응하도록 `LayoutBuilder`·`MediaQuery`·`AdaptiveLayout`을 적극 사용합니다.
- **접근성 우선**: 텍스트 대비, 음성 안내, 다크/라이트 모드, 동적 텍스트 크기 조절을 모든 화면에서 기본값으로 고려합니다.

## 시각 언어

### 컬러 시스템
- **Primary**: BMW Blue `#1C69D4` (핵심 액션, 하이라이트)
- **Secondary**: MINI Accent `#FFCC00` (보조 액션, 경고 아님)
- **Surface**: 
  - 다크: `#0F141C` (BMW Night)
  - 라이트: `#F7F8FA`
- **Neutral**: 텍스트와 경계용 `#E2E6ED`, `#8A93A6`, `#FFFFFF`
- **Feedback**: Success `#1BBF72`, Warning `#FFB74D`, Error `#E53935`

> Flutter 구현 시 `ColorScheme`를 정의하고 모든 `ThemeData` 구성 요소가 이 스킴을 참조하게 합니다. 직접적인 `Color(...)` 하드코딩은 금지하며, 디자인 토큰은 `lib/theme/tokens.dart`에서만 선언합니다.

### 타이포그래피
- **기본 서체**: Apple 플랫폼에서는 `SF Pro`, 그 외에는 `Roboto` 또는 `Inter` (Google Fonts 패키지로 제공)
- **규칙**:
  - Heading 계층: Display(Largest) → Headline → Title → Body → Label
  - 기기 폭에 따라 `MediaQuery.textScaler`를 고려해 동적 크기를 적용
  - 긴 텍스트는 `Text.rich` 및 `WidgetSpan`으로 의미 단위 구성
- Flutter 구현 시 `TextTheme`를 커스터마이즈하고 `Theme.of(context).textTheme`을 통해서만 접근합니다.

### 아이콘·이미지 스타일
- 아이콘은 선 굵기 2dp, 둥근 모서리 비율 4px, 채우기보다 선형(linear)을 기본으로 사용합니다.
- 사진/일러스트는 고대비, 화이트 스페이스가 많은 구도. 자동차·운동 톤을 살린 배경을 사용합니다.
- Adaptive rendering: iOS에서는 SF Symbols 매핑, Android에서는 Material Icons 사용. 공통으로 필요한 아이콘은 `flutter_svg` 또는 커스텀 벡터로 관리합니다.

## 레이아웃 및 반응형 설계
- **세이프 영역**: `SafeArea`를 기본으로 감싸 UI가 노치·홈 인디케이터와 겹치지 않도록 합니다.
- **그리드 시스템**:
  - 모바일: 4dp grid, 기본 패딩 16dp
  - 태블릿: 8dp grid, 기본 패딩 24dp
  - 데스크톱/웹: 12dp grid, 기본 패딩 32dp 이상
- **레이아웃 도구**:
  - 간단한 적응형: `LayoutBuilder` + breakpoints (≤599, 600–1023, ≥1024)
  - 고급 적응형: `AdaptiveLayout`(Material 3) 또는 `NavigationRail` + `NavigationBar` 조합
  - 스크롤 영역은 `CustomScrollView`와 Sliver 계열 위젯으로 구성하여 iOS/Android에서 일관된 관성 효과를 유지합니다.

## 컴포넌트 아키텍처
```
lib/
├── app/
│   ├── app.dart               # MaterialApp/GoRouter 설정
│   └── injection.dart         # Provider / Riverpod / GetIt 등 DI 설정
├── theme/
│   ├── tokens.dart            # 색상, 간격, 타이포그래피 토큰
│   ├── theme.dart             # ThemeData / CupertinoThemeData
│   └── typography.dart
├── presentation/
│   ├── atoms/                 # 버튼, 배지, 라벨 등 최소 단위
│   ├── molecules/             # 카드, 목록 아이템, 입력 필드 조합
│   ├── organisms/             # 대시보드 카드, 서브 헤더 등
│   └── pages/                 # 화면 단위, stateful
├── utils/
│   └── responsive.dart        # 브레이크포인트/레이아웃 헬퍼
└── accessibility/
    └── semantics_extensions.dart
```
- **파일 길이**: 250라인을 넘기지 않습니다. 필요 시 Atom/Molecule으로 분할.
- **위젯 이름 규칙**: `PrefixRoleWidget` (예: `CoachPrimaryButton`, `ScheduleOverviewCard`)
- **상태 관리**: Riverpod/Bloc 등 선택한 패턴을 일관되게 적용. UI 레이어는 상태 로직을 직접 호출하지 않고 Provider/Controller를 통해 접근합니다.

## 인터랙션 & 모션
- **속도**: 진입 240ms, 퇴장 200ms, 강조 애니메이션 70ms(Apple HIG 권장 범위 준수)
- **곡선**: iOS는 `Curves.easeInOutCubic`, Android는 `Easing.emphasized` 계열을 사용
- **전환**:
  - 페이지 전환: 플랫폼에 맞는 `PageTransitionsTheme` 설정 (iOS Swipe, Android FadeThrough)
  - 요소 강조: `Hero`, `AnimatedSwitcher`, `AnimatedPositioned` 사용. 프레임 드랍 없는 60fps 목표
- **피드백**: 버튼·리스트 상호작용 시 `HapticFeedback.lightImpact()` 또는 플랫폼 기본 음향 사용

## 접근성
- **대비**: 텍스트 대비 4.5:1 이상. 다크 모드에서 블루/옐로는 명도 조정 후 사용
- **스케일링**: `MediaQuery.textScaleFactor` 최대 1.5까지 UI 깨짐 없이 대응
- **스크린리더**: 모든 상호작용 요소에 `Semantics` 레이블/힌트 제공
- **포커스 순서**: 키보드/리모컨 입력을 고려하여 `FocusTraversalGroup` 설정

## 구현 가이드

### 테마 초기화 예시
```dart
// lib/theme/theme.dart
ThemeData buildAppTheme() {
  const scheme = AppColorScheme.dark(); // tokens.dart에서 정의

  return ThemeData(
    colorScheme: scheme.toMaterial(),
    useMaterial3: true,
    textTheme: buildTextTheme(),
    visualDensity: VisualDensity.comfortable,
    scaffoldBackgroundColor: scheme.surface,
    navigationBarTheme: navigationBarTheme(scheme),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
```

### 디자인 토큰 구조
```dart
// lib/theme/tokens.dart
class AppColorScheme {
  final Color primary = const Color(0xFF1C69D4);
  final Color secondary = const Color(0xFFFFCC00);
  final Color surface = const Color(0xFF0F141C);
  final Color surfaceVariant = const Color(0xFF141B26);
  final Color onPrimary = Colors.white;
  final Color onSurface = const Color(0xFFE2E6ED);

  const AppColorScheme.dark();

  ColorScheme toMaterial() => ColorScheme(
        brightness: Brightness.dark,
        primary: primary,
        onPrimary: onPrimary,
        secondary: secondary,
        onSecondary: Colors.black,
        surface: surface,
        onSurface: onSurface,
        error: const Color(0xFFE53935),
        onError: Colors.white,
      );
}
```

### 컴포넌트 제작 체크리스트
- [ ] 토큰(`AppColorScheme`, `AppSpacing`)만 사용했는가?
- [ ] `Semantics` 정보가 필요한 위젯인가?
- [ ] 모바일/태블릿/데스크톱에서 간격과 폰트가 자연스러운가?
- [ ] 애니메이션이 플랫폼 모션 가이드와 일치하는가?
- [ ] 모듈화되어 다른 페이지에서 재사용 가능한가?

## 테스트 및 QA
- **비주얼 리그레션**: `golden_toolkit`으로 주요 컴포넌트를 골든 테스트합니다.
- **접근성 검사**: `flutter_gherkin` 시나리오에 스크린리더 흐름을 포함합니다.
- **디자인 검증**: Figma 스타일(색상, 라운딩, 그림자)을 `Widgetbook` 또는 `Dashbook`으로 미러링해 디자이너와 실시간 검수합니다.

## 리소스
- Apple Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/
- BMW·MINI Connected Design Article: https://medium.com/flutter
- Flutter Adaptive Design Docs: https://docs.flutter.dev/ui/layout/adaptive
- Material 3 for Flutter: https://m3.material.io

위 가이드는 Flutter 위젯 구조, 디자인 토큰, 접근성, 모션, 테스트까지 전반을 포괄합니다. 모든 화면·컴포넌트는 본문 원칙을 준수하며, 변경 사항은 Figma와 문서를 싱크하여 유지합니다.
