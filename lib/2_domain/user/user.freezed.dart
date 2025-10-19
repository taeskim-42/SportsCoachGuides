// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  String get name => throw _privateConstructorUsedError;
  bool get isOpenProfile => throw _privateConstructorUsedError;
  String? get loginInfomation => throw _privateConstructorUsedError;
  String? get introduce => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String name,
      bool isOpenProfile,
      String? loginInfomation,
      String? introduce,
      String? imageUrl});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOpenProfile = null,
    Object? loginInfomation = freezed,
    Object? introduce = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenProfile: null == isOpenProfile
          ? _value.isOpenProfile
          : isOpenProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      loginInfomation: freezed == loginInfomation
          ? _value.loginInfomation
          : loginInfomation // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      bool isOpenProfile,
      String? loginInfomation,
      String? introduce,
      String? imageUrl});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? isOpenProfile = null,
    Object? loginInfomation = freezed,
    Object? introduce = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$UserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenProfile: null == isOpenProfile
          ? _value.isOpenProfile
          : isOpenProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      loginInfomation: freezed == loginInfomation
          ? _value.loginInfomation
          : loginInfomation // ignore: cast_nullable_to_non_nullable
              as String?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.name,
      required this.isOpenProfile,
      this.loginInfomation,
      this.introduce,
      this.imageUrl})
      : super._();

  @override
  final String name;
  @override
  final bool isOpenProfile;
  @override
  final String? loginInfomation;
  @override
  final String? introduce;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'User(name: $name, isOpenProfile: $isOpenProfile, loginInfomation: $loginInfomation, introduce: $introduce, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isOpenProfile, isOpenProfile) ||
                other.isOpenProfile == isOpenProfile) &&
            (identical(other.loginInfomation, loginInfomation) ||
                other.loginInfomation == loginInfomation) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, isOpenProfile, loginInfomation, introduce, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String name,
      required final bool isOpenProfile,
      final String? loginInfomation,
      final String? introduce,
      final String? imageUrl}) = _$UserImpl;
  const _User._() : super._();

  @override
  String get name;
  @override
  bool get isOpenProfile;
  @override
  String? get loginInfomation;
  @override
  String? get introduce;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherUser {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get introduce => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtherUserCopyWith<OtherUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherUserCopyWith<$Res> {
  factory $OtherUserCopyWith(OtherUser value, $Res Function(OtherUser) then) =
      _$OtherUserCopyWithImpl<$Res, OtherUser>;
  @useResult
  $Res call({String name, String imageUrl, String introduce});
}

/// @nodoc
class _$OtherUserCopyWithImpl<$Res, $Val extends OtherUser>
    implements $OtherUserCopyWith<$Res> {
  _$OtherUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? introduce = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: null == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherUserImplCopyWith<$Res>
    implements $OtherUserCopyWith<$Res> {
  factory _$$OtherUserImplCopyWith(
          _$OtherUserImpl value, $Res Function(_$OtherUserImpl) then) =
      __$$OtherUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl, String introduce});
}

/// @nodoc
class __$$OtherUserImplCopyWithImpl<$Res>
    extends _$OtherUserCopyWithImpl<$Res, _$OtherUserImpl>
    implements _$$OtherUserImplCopyWith<$Res> {
  __$$OtherUserImplCopyWithImpl(
      _$OtherUserImpl _value, $Res Function(_$OtherUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? introduce = null,
  }) {
    return _then(_$OtherUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: null == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OtherUserImpl implements _OtherUser {
  const _$OtherUserImpl(
      {required this.name, required this.imageUrl, required this.introduce});

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String introduce;

  @override
  String toString() {
    return 'OtherUser(name: $name, imageUrl: $imageUrl, introduce: $introduce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, introduce);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherUserImplCopyWith<_$OtherUserImpl> get copyWith =>
      __$$OtherUserImplCopyWithImpl<_$OtherUserImpl>(this, _$identity);
}

abstract class _OtherUser implements OtherUser {
  const factory _OtherUser(
      {required final String name,
      required final String imageUrl,
      required final String introduce}) = _$OtherUserImpl;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get introduce;
  @override
  @JsonKey(ignore: true)
  _$$OtherUserImplCopyWith<_$OtherUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlockedUser {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockedUserCopyWith<BlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUserCopyWith<$Res> {
  factory $BlockedUserCopyWith(
          BlockedUser value, $Res Function(BlockedUser) then) =
      _$BlockedUserCopyWithImpl<$Res, BlockedUser>;
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class _$BlockedUserCopyWithImpl<$Res, $Val extends BlockedUser>
    implements $BlockedUserCopyWith<$Res> {
  _$BlockedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockedUserImplCopyWith<$Res>
    implements $BlockedUserCopyWith<$Res> {
  factory _$$BlockedUserImplCopyWith(
          _$BlockedUserImpl value, $Res Function(_$BlockedUserImpl) then) =
      __$$BlockedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class __$$BlockedUserImplCopyWithImpl<$Res>
    extends _$BlockedUserCopyWithImpl<$Res, _$BlockedUserImpl>
    implements _$$BlockedUserImplCopyWith<$Res> {
  __$$BlockedUserImplCopyWithImpl(
      _$BlockedUserImpl _value, $Res Function(_$BlockedUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$BlockedUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BlockedUserImpl implements _BlockedUser {
  const _$BlockedUserImpl({required this.name, required this.imageUrl});

  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'BlockedUser(name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedUserImplCopyWith<_$BlockedUserImpl> get copyWith =>
      __$$BlockedUserImplCopyWithImpl<_$BlockedUserImpl>(this, _$identity);
}

abstract class _BlockedUser implements BlockedUser {
  const factory _BlockedUser(
      {required final String name,
      required final String imageUrl}) = _$BlockedUserImpl;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$BlockedUserImplCopyWith<_$BlockedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
