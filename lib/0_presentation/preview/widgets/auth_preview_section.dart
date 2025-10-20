import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/design_system.dart';
import 'package:oli/0_presentation/preview/widgets/section_header.dart';

class AuthPreviewSection extends StatelessWidget {
  const AuthPreviewSection({required this.header, super.key});

  final SectionHeader header;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('auth-preview'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          _AuthCard(),
          const SizedBox(height: 20),
          _SignUpHighlights(),
          const SizedBox(height: 20),
          _FeatureChecklist(),
        ],
      ),
    );
  }
}

class _AuthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Firebase 이메일 로그인', style: AppTextTheme.h4),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '이메일',
                hintText: 'coach@example.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Checkbox(value: true, onChanged: (_) {}),
                Text('자동 로그인 유지', style: AppTextTheme.body3),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('비밀번호 찾기'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.lock_open_rounded),
                label: const Text('로그인'),
              ),
            ),
            const SizedBox(height: 16),
            Text('소셜 연동 (OAuth)', style: AppTextTheme.body3),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              children: const [
                _SocialButton(icon: Icons.g_mobiledata, label: 'Google'),
                _SocialButton(icon: Icons.apple, label: 'Apple'),
                _SocialButton(icon: Icons.chat_bubble_outline, label: 'Kakao'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('회원가입 여정', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            _StepTile(
              index: 1,
              title: '약관 동의',
              description: '서비스 이용약관, 개인정보 수집·이용, 마케팅 선택 동의 처리',
            ),
            _StepTile(
              index: 2,
              title: '기본 정보 입력',
              description: '이름, 이메일, 비밀번호, 주 종목 선택',
            ),
            _StepTile(
              index: 3,
              title: '실습 트랙 설정',
              description: '관심 종목, 학습 목표, 주당 학습 시간 등록',
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColorScheme.backgroundSky,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_user_rounded,
                      color: Colors.black87),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Firebase Auth + Firestore 프로필 생성 흐름이 연결되어 있는지 QA에서 확인하세요.',
                      style: AppTextTheme.body3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureChecklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checklist = [
      ('이메일/비밀번호 로그인', true),
      ('소셜 로그인 토큰 처리', false),
      ('프로필 생성 가이드', true),
      ('보안 경고 및 에러 핸들링', false),
    ];

    return Card(
      color: AppColorScheme.grayScaleWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('QA 체크리스트', style: AppTextTheme.h4),
            const SizedBox(height: 12),
            for (final item in checklist)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(
                      item.$2
                          ? Icons.check_circle_rounded
                          : Icons.radio_button_unchecked,
                      color: item.$2
                          ? AppColorScheme.primaryFontLine
                          : AppColorScheme.grayScaleIconLight,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(item.$1, style: AppTextTheme.body2),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.$2
                            ? AppColorScheme.backgroundBlue
                            : AppColorScheme.grayScaleLineLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.$2 ? '완료' : '진행중',
                        style: AppTextTheme.body3,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({
    required this.index,
    required this.title,
    required this.description,
  });

  final int index;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColorScheme.primaryFontLine,
            child: Text('$index', style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextTheme.body2),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextTheme.body3
                      .copyWith(color: AppColorScheme.caption),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label, style: AppTextTheme.body4),
    );
  }
}
