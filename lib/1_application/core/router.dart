import 'package:get/get.dart';
import 'package:oli/2_domain/terms/terms.dart';

abstract class IAppRouter {
  void toSplashOffAll();
  void toSignInOffAll();
  void toDiagnosisOffAll();
  void toCommunityOffAll({int? initialCommunityId});
  void toProfileOffAll({int? initialTabIndex});

  void toSignUpCongratsOffAll();
  Future<T?>? toTerms<T>();
  Future<T?>? toTermsDetail<T>({required Terms terms});
  Future<T?>? toCreateUserProFile<T>();
  Future<T?>? toUpdateUserProfile<T>();

  Future<T?>? toCommunity<T>();
  Future<T?>? toBlock<T>();
  Future<T?>? toReport<T>({required dynamic commentOrPost});
  Future<T?>? toSetting<T>();
  Future<T?>? toServiceReport<T>();

  void back<T>({T? result, bool closeOverlay = true});
}

class AppRouter extends IAppRouter {
  @override
  void toSplashOffAll() {
    Get.offAllNamed('/');
  }

  //////////////////////////////////////////////////////////////////////////////
  /// sign in Begin                                                          ///
  @override
  void toSignInOffAll() {
    Get.offAllNamed('/signIn');
  }

  @override
  Future<T?>? toTerms<T>() {
    return Get.toNamed<T>('/signUp/terms');
  }

  @override
  void toSignUpCongratsOffAll() {
    Get.offAllNamed('/signUp/congrats');
  }

  /// sign in End                                                            ///
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  /// User Begin                                                             ///
  @override
  Future<T?>? toCreateUserProFile<T>() {
    return Get.toNamed<T>('/user/create');
  }

  @override
  Future<T?>? toUpdateUserProfile<T>() {
    return Get.toNamed<T>('/user/update');
  }

  /// User End                                                               ///
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  /// Community Begin
  @override
  void toCommunityOffAll({int? initialCommunityId}) {
    Get.offAllNamed('/community',
        arguments: {'communityId': initialCommunityId});
  }

  @override
  Future<T?>? toCommunity<T>() {
    return Get.toNamed<T>('/community');
  }

  @override
  Future<T?>? toBlock<T>() {
    return Get.toNamed<T>('/community/block');
  }

  @override
  Future<T?>? toReport<T>({required dynamic commentOrPost}) {
    return Get.toNamed<T>('/community/report', arguments: {
      'commentOrPost': commentOrPost,
    });
  }

  //////////////////////////////////////////////////////////////////////////////
  /// Profile Begin

  @override
  void toProfileOffAll({int? initialTabIndex}) {
    Get.offAllNamed('/profile',
        arguments: {'initialTabIndex': initialTabIndex});
  }

  /// Profile End
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  /// Setting Begin
  @override
  Future<T?>? toSetting<T>() {
    return Get.toNamed<T>('/setting');
  }

  /// Setting End
  //////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////////////////////////////////////////
  /// Setting Begin
  @override
  Future<T?>? toServiceReport<T>() {
    return Get.toNamed<T>('/service/report');
  }

  /// Setting End
  //////////////////////////////////////////////////////////////////////////////

  @override
  void back<T>({T? result, bool closeOverlay = true}) {
    return Get.back<T>(result: result, closeOverlays: closeOverlay);
  }

  @override
  void toDiagnosisOffAll() {
    Get.offAllNamed('/study');
  }

  @override
  Future<T?>? toTermsDetail<T>({required Terms terms}) {
    // TODO: implement toTermsDetail
    throw UnimplementedError();
  }
}
