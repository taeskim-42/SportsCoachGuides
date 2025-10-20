import 'package:flutter/material.dart';

@immutable
class YoutubeResource {
  const YoutubeResource({
    required this.id,
    required this.title,
    required this.channelName,
    required this.duration,
    required this.url,
    required this.relatedQuestionId,
  });

  final String id;
  final String title;
  final String channelName;
  final String duration;
  final String url;
  final String relatedQuestionId;
}
