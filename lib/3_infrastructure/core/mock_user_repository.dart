import 'package:dartz/dartz.dart';
import 'package:oli/2_domain/user/i_user_repository.dart';
import 'package:oli/2_domain/user/user.dart';

class MockUserRepository implements IUserRepository {
  MockUserRepository();

  final User _demoUser = const User(
    name: '민지 코치',
    isOpenProfile: true,
    introduce: '생활체육지도자 2급 준비생',
  );

  @override
  Future<Either<String, Unit>> deleteCurrent() async {
    return right(unit);
  }

  @override
  Future<Either<int, User>> getCurrent() async {
    return right(_demoUser);
  }

  @override
  Future<Either<String, OtherUser>> getOtherUser({required String name}) async {
    return right(
      OtherUser(
        name: name,
        imageUrl: defaultUserImageUrl,
        introduce: '동료 코치와 경험을 공유하세요.',
      ),
    );
  }

  @override
  Future<void> tryUpdateMessageToken() async {}

  @override
  Future<Either<String, Unit>> updateUser(User user) async {
    return right(unit);
  }
}
