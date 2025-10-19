import 'package:oli/2_domain/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  Future<Either<String, Unit>> updateUser(User user);
  Future<Either<String, OtherUser>> getOtherUser({required String name});
  Future<void> tryUpdateMessageToken();

  /// left => error state
  Future<Either<int, User>> getCurrent();

  Future<Either<String, Unit>> deleteCurrent();
}
