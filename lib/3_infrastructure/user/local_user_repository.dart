import 'package:dartz/dartz.dart';
import 'package:oli/2_domain/user/i_user_repository.dart';
import 'package:oli/2_domain/user/user.dart';

class LocalUserRepository implements IUserRepository {
  LocalUserRepository();

  User? _currentUser = const User(
    name: '민지',
    isOpenProfile: true,
    introduce: '생활체육지도자 2급 준비생으로 축구 트랙을 집중 학습 중입니다.',
  );

  @override
  Future<Either<String, Unit>> deleteCurrent() async {
    _currentUser = null;
    return right(unit);
  }

  @override
  Future<Either<int, User>> getCurrent() async {
    final user = _currentUser;
    if (user == null) {
      return left(401);
    }
    return right(user);
  }

  @override
  Future<Either<String, OtherUser>> getOtherUser({required String name}) async {
    return right(
      OtherUser(
        name: name,
        imageUrl: defaultUserImageUrl,
        introduce: '커뮤니티 정보는 아직 준비 중입니다.',
      ),
    );
  }

  @override
  Future<void> tryUpdateMessageToken() async {
    // no-op for local implementation
  }

  @override
  Future<Either<String, Unit>> updateUser(User user) async {
    _currentUser = user;
    return right(unit);
  }
}
