import 'package:flutter/material.dart';
import 'package:oli/0_presentation/core/design_system.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.completeness,
    super.key,
  });

  final String title;
  final double completeness;

  @override
  Widget build(BuildContext context) {
    final percentage = (completeness * 100).toStringAsFixed(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.h1.copyWith(
            color: AppColorScheme.title,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '완성도 $percentage%',
              style: AppTextTheme.body2.copyWith(
                color: AppColorScheme.caption,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColorScheme.buttonBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                completeness >= 0.85
                    ? '실사용 준비'
                    : completeness >= 0.7
                        ? 'MVP 수준'
                        : '초안 검토 필요',
                style: AppTextTheme.body4.copyWith(
                  color: AppColorScheme.primaryFontLine,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: completeness,
            minHeight: 6,
            backgroundColor: AppColorScheme.grayScaleLineLight,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColorScheme.primaryFontLine,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
