// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

const defaultUserImageUrl =
    'https://user-images.githubusercontent.com/74593890/186898772-31ebdc3f-0a78-4600-983a-fef6e30db574.png';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required bool isOpenProfile,
    String? loginInfomation,
    String? introduce,
    String? imageUrl,
  }) = _User;

  const User._();

  factory User.empty() => const User(
        name: '',
        isOpenProfile: true,
      );

  String get imagePath => imageUrl ?? defaultUserImageUrl;
}

@freezed
class OtherUser with _$OtherUser {
  const factory OtherUser({
    required String name,
    required String imageUrl,
    required String introduce,
  }) = _OtherUser;

  factory OtherUser.empty() => const OtherUser(
        name: '속삭이는 몽자',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk25l1MozxpI6e9o3b_wS6OsaUTTnv8swQIXzlicpEmjV5nacxLlwm8hwv3dLDi1OGwM8&usqp=CAU',
        introduce:
            '말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥말괄량이 꼬마강아지 몽자의 유쾌한일상♥',
      );
}

@freezed
class BlockedUser with _$BlockedUser {
  const factory BlockedUser({
    required String name,
    required String imageUrl,
  }) = _BlockedUser;

  factory BlockedUser.fromJson(Map<String, dynamic> json) {
    return BlockedUser(
      name: json['nickname'] as String,
      imageUrl: json['image_uri'] as String,
    );
  }
}
