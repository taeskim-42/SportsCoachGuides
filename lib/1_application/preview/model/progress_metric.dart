import 'package:flutter/material.dart';

enum ProgressMetricType { ratio, progress, time }

@immutable
class ProgressMetric {
  const ProgressMetric({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.targetLabel,
    required this.type,
  });

  final String id;
  final String title;
  final String description;
  final double value;
  final String targetLabel;
  final ProgressMetricType type;

  String get percentageLabel => '${(value * 100).toStringAsFixed(0)}%';
}
