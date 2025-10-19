// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Terms {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  bool get isEssential => throw _privateConstructorUsedError;
  bool get isAgreed => throw _privateConstructorUsedError;
  List<TermsItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsCopyWith<Terms> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsCopyWith<$Res> {
  factory $TermsCopyWith(Terms value, $Res Function(Terms) then) =
      _$TermsCopyWithImpl<$Res, Terms>;
  @useResult
  $Res call(
      {int id,
      String title,
      String summary,
      bool isEssential,
      bool isAgreed,
      List<TermsItem> items});
}

/// @nodoc
class _$TermsCopyWithImpl<$Res, $Val extends Terms>
    implements $TermsCopyWith<$Res> {
  _$TermsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? isEssential = null,
    Object? isAgreed = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      isEssential: null == isEssential
          ? _value.isEssential
          : isEssential // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TermsItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsImplCopyWith<$Res> implements $TermsCopyWith<$Res> {
  factory _$$TermsImplCopyWith(
          _$TermsImpl value, $Res Function(_$TermsImpl) then) =
      __$$TermsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String summary,
      bool isEssential,
      bool isAgreed,
      List<TermsItem> items});
}

/// @nodoc
class __$$TermsImplCopyWithImpl<$Res>
    extends _$TermsCopyWithImpl<$Res, _$TermsImpl>
    implements _$$TermsImplCopyWith<$Res> {
  __$$TermsImplCopyWithImpl(
      _$TermsImpl _value, $Res Function(_$TermsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? isEssential = null,
    Object? isAgreed = null,
    Object? items = null,
  }) {
    return _then(_$TermsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      isEssential: null == isEssential
          ? _value.isEssential
          : isEssential // ignore: cast_nullable_to_non_nullable
              as bool,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TermsItem>,
    ));
  }
}

/// @nodoc

class _$TermsImpl implements _Terms {
  const _$TermsImpl(
      {required this.id,
      required this.title,
      required this.summary,
      required this.isEssential,
      required this.isAgreed,
      required final List<TermsItem> items})
      : _items = items;

  @override
  final int id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final bool isEssential;
  @override
  final bool isAgreed;
  final List<TermsItem> _items;
  @override
  List<TermsItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Terms(id: $id, title: $title, summary: $summary, isEssential: $isEssential, isAgreed: $isAgreed, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.isEssential, isEssential) ||
                other.isEssential == isEssential) &&
            (identical(other.isAgreed, isAgreed) ||
                other.isAgreed == isAgreed) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, summary, isEssential,
      isAgreed, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsImplCopyWith<_$TermsImpl> get copyWith =>
      __$$TermsImplCopyWithImpl<_$TermsImpl>(this, _$identity);
}

abstract class _Terms implements Terms {
  const factory _Terms(
      {required final int id,
      required final String title,
      required final String summary,
      required final bool isEssential,
      required final bool isAgreed,
      required final List<TermsItem> items}) = _$TermsImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  bool get isEssential;
  @override
  bool get isAgreed;
  @override
  List<TermsItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$TermsImplCopyWith<_$TermsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TermsItem {
  String get title => throw _privateConstructorUsedError;
  List<TermsItemDetail> get details => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsItemCopyWith<TermsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsItemCopyWith<$Res> {
  factory $TermsItemCopyWith(TermsItem value, $Res Function(TermsItem) then) =
      _$TermsItemCopyWithImpl<$Res, TermsItem>;
  @useResult
  $Res call({String title, List<TermsItemDetail> details});
}

/// @nodoc
class _$TermsItemCopyWithImpl<$Res, $Val extends TermsItem>
    implements $TermsItemCopyWith<$Res> {
  _$TermsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TermsItemDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsItemImplCopyWith<$Res>
    implements $TermsItemCopyWith<$Res> {
  factory _$$TermsItemImplCopyWith(
          _$TermsItemImpl value, $Res Function(_$TermsItemImpl) then) =
      __$$TermsItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<TermsItemDetail> details});
}

/// @nodoc
class __$$TermsItemImplCopyWithImpl<$Res>
    extends _$TermsItemCopyWithImpl<$Res, _$TermsItemImpl>
    implements _$$TermsItemImplCopyWith<$Res> {
  __$$TermsItemImplCopyWithImpl(
      _$TermsItemImpl _value, $Res Function(_$TermsItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? details = null,
  }) {
    return _then(_$TermsItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<TermsItemDetail>,
    ));
  }
}

/// @nodoc

class _$TermsItemImpl implements _TermsItem {
  const _$TermsItemImpl(
      {required this.title, required final List<TermsItemDetail> details})
      : _details = details;

  @override
  final String title;
  final List<TermsItemDetail> _details;
  @override
  List<TermsItemDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'TermsItem(title: $title, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsItemImplCopyWith<_$TermsItemImpl> get copyWith =>
      __$$TermsItemImplCopyWithImpl<_$TermsItemImpl>(this, _$identity);
}

abstract class _TermsItem implements TermsItem {
  const factory _TermsItem(
      {required final String title,
      required final List<TermsItemDetail> details}) = _$TermsItemImpl;

  @override
  String get title;
  @override
  List<TermsItemDetail> get details;
  @override
  @JsonKey(ignore: true)
  _$$TermsItemImplCopyWith<_$TermsItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TermsItemDetail {
  String? get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TermsItemDetailCopyWith<TermsItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsItemDetailCopyWith<$Res> {
  factory $TermsItemDetailCopyWith(
          TermsItemDetail value, $Res Function(TermsItemDetail) then) =
      _$TermsItemDetailCopyWithImpl<$Res, TermsItemDetail>;
  @useResult
  $Res call({String? title, String content});
}

/// @nodoc
class _$TermsItemDetailCopyWithImpl<$Res, $Val extends TermsItemDetail>
    implements $TermsItemDetailCopyWith<$Res> {
  _$TermsItemDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsItemDetailImplCopyWith<$Res>
    implements $TermsItemDetailCopyWith<$Res> {
  factory _$$TermsItemDetailImplCopyWith(_$TermsItemDetailImpl value,
          $Res Function(_$TermsItemDetailImpl) then) =
      __$$TermsItemDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String content});
}

/// @nodoc
class __$$TermsItemDetailImplCopyWithImpl<$Res>
    extends _$TermsItemDetailCopyWithImpl<$Res, _$TermsItemDetailImpl>
    implements _$$TermsItemDetailImplCopyWith<$Res> {
  __$$TermsItemDetailImplCopyWithImpl(
      _$TermsItemDetailImpl _value, $Res Function(_$TermsItemDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = null,
  }) {
    return _then(_$TermsItemDetailImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TermsItemDetailImpl implements _TermsItemDetail {
  const _$TermsItemDetailImpl({this.title, required this.content});

  @override
  final String? title;
  @override
  final String content;

  @override
  String toString() {
    return 'TermsItemDetail(title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsItemDetailImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsItemDetailImplCopyWith<_$TermsItemDetailImpl> get copyWith =>
      __$$TermsItemDetailImplCopyWithImpl<_$TermsItemDetailImpl>(
          this, _$identity);
}

abstract class _TermsItemDetail implements TermsItemDetail {
  const factory _TermsItemDetail(
      {final String? title,
      required final String content}) = _$TermsItemDetailImpl;

  @override
  String? get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$TermsItemDetailImplCopyWith<_$TermsItemDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
