// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms.freezed.dart';

@freezed
class Terms with _$Terms {
  const factory Terms({
    required int id,
    required String title,
    required String summary,
    required bool isEssential,
    required bool isAgreed,
    required List<TermsItem> items,
  }) = _Terms;
}

@freezed
class TermsItem with _$TermsItem {
  const factory TermsItem({
    required String title,
    required List<TermsItemDetail> details,
  }) = _TermsItem;
}

@freezed
class TermsItemDetail with _$TermsItemDetail {
  const factory TermsItemDetail({
    String? title,
    required String content,
  }) = _TermsItemDetail;
}

bool isAllAgreed(List<Terms> terms) {
  final filtered = terms.where((t) => t.isEssential && !t.isAgreed).toList();
  return filtered.isEmpty;
}
