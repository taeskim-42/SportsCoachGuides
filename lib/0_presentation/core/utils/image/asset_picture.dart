import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oli/0_presentation/core/design_system.dart';

//: todo: 이미지 모두 바꿔야함.

enum AppPicutreAssetType {
  logo,
  naver,
  kakao,
  facebook,
  google,
  apple,
  checkFill,
  checkEmpty,
  checkFillOutline,
  checkEmptyOutline,
  defaultUser,
  defaultPet,
  camera,
  petBackground,
  cameraCenterBackground,
  diagChatbot,
  diagPicture,
  diagnosisEmpty,
  communityEmpty,
  profileEmpty,
  diagnosisFill,
  communityFill,
  profileFill,
  logoText,
  logoWhite,
  light,
  lightPrevent,
  change,
  takeShotExample,
  enter,
  behaviorChatbot,
  questionAndAnswer,
  cat,
  dog,
  rightArrow,
  finder,
  write,
  more,
  communityPhoto,
  communityPet,
  communityCamera,
  communityKeyboardDown,
  delete,
  celebration,
  checkCircle,
  unCheckCircle,
}

class AppPicutreAsset extends StatelessWidget {
  final AppPicutreAssetType assetType;

  const AppPicutreAsset({
    Key? key,
    required this.assetType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (assetType) {
      case AppPicutreAssetType.logo:
        return SvgPicture.asset('assets/images/logos/logo.svg');
      case AppPicutreAssetType.naver:
        return SvgPicture.asset('assets/images/logos/naver.svg');
      case AppPicutreAssetType.kakao:
        return SvgPicture.asset('assets/images/logos/kakao.svg');
      case AppPicutreAssetType.facebook:
        return SvgPicture.asset('assets/images/logos/facebook.svg');
      case AppPicutreAssetType.google:
        return SvgPicture.asset('assets/images/logos/google.svg');
      case AppPicutreAssetType.apple:
        return SvgPicture.asset('assets/images/logos/apple.svg');
      case AppPicutreAssetType.checkFill:
        return SvgPicture.asset('assets/icons/check_fill.svg');
      case AppPicutreAssetType.checkEmpty:
        return SvgPicture.asset('assets/icons/check_empty.svg');
      case AppPicutreAssetType.checkFillOutline:
        return SvgPicture.asset('assets/icons/check_fill_outline.svg');
      case AppPicutreAssetType.checkEmptyOutline:
        return SvgPicture.asset('assets/icons/check_empty_outline.svg');
      case AppPicutreAssetType.defaultUser:
        return SvgPicture.asset('assets/icons/user_default.svg');
      case AppPicutreAssetType.camera:
        return SvgPicture.asset('assets/icons/camera.svg');
      case AppPicutreAssetType.defaultPet:
        return SvgPicture.asset('assets/icons/pet_default.svg');
      case AppPicutreAssetType.petBackground:
        return SvgPicture.asset(
          'assets/images/backgrounds/pet_background.svg',
          fit: BoxFit.cover,
        );
      case AppPicutreAssetType.diagChatbot:
        return Image.asset('assets/images/logos/diag_chatbot.png');
      case AppPicutreAssetType.diagPicture:
        return Image.asset('assets/images/logos/diag_picture.png');
      case AppPicutreAssetType.diagnosisEmpty:
        return SvgPicture.asset('assets/icons/diagnosis_empty.svg');
      case AppPicutreAssetType.communityEmpty:
        return SvgPicture.asset('assets/icons/community_empty.svg');
      case AppPicutreAssetType.profileEmpty:
        return SvgPicture.asset('assets/icons/profile_empty.svg');
      case AppPicutreAssetType.diagnosisFill:
        return SvgPicture.asset(
          'assets/icons/diagnosis_empty.svg',
          color: AppColorScheme.primaryFontLine,
        );
      case AppPicutreAssetType.communityFill:
        return SvgPicture.asset(
          'assets/icons/community_empty.svg',
          color: AppColorScheme.primaryFontLine,
        );
      case AppPicutreAssetType.profileFill:
        return SvgPicture.asset(
          'assets/icons/profile_empty.svg',
          color: AppColorScheme.primaryFontLine,
        );
      case AppPicutreAssetType.logoText:
        return SvgPicture.asset('assets/images/logos/logo_text.svg');
      case AppPicutreAssetType.logoWhite:
        return SvgPicture.asset('assets/images/logos/logo_white.svg');
      case AppPicutreAssetType.cameraCenterBackground:
        return Image.asset(
            'assets/images/backgrounds/camera_center_background.png');
      case AppPicutreAssetType.light:
        return SvgPicture.asset('assets/icons/light.svg');
      case AppPicutreAssetType.change:
        return SvgPicture.asset('assets/icons/change.svg');
      case AppPicutreAssetType.takeShotExample:
        return Image.asset('assets/images/take_shot_exmaple.png');
      case AppPicutreAssetType.lightPrevent:
        return SvgPicture.asset('assets/icons/light_prevent.svg');
      case AppPicutreAssetType.enter:
        return SvgPicture.asset('assets/icons/enter.svg');
      case AppPicutreAssetType.behaviorChatbot:
        return SvgPicture.asset('assets/icons/behavior_chatbot.svg');
      case AppPicutreAssetType.questionAndAnswer:
        return SvgPicture.asset('assets/icons/question_and_answer.svg');
      case AppPicutreAssetType.cat:
        return Image.asset('assets/icons/cat.png');
      case AppPicutreAssetType.dog:
        return Image.asset('assets/icons/dog.png');
      case AppPicutreAssetType.rightArrow:
        return Image.asset('assets/icons/right_arrow.png');
      case AppPicutreAssetType.finder:
        return Image.asset('assets/icons/finder.png');
      case AppPicutreAssetType.write:
        return Image.asset('assets/icons/write.png');
      case AppPicutreAssetType.more:
        return SvgPicture.asset('assets/icons/more.svg');
      case AppPicutreAssetType.communityPhoto:
        return SvgPicture.asset('assets/icons/community_photo.svg');
      case AppPicutreAssetType.communityPet:
        return SvgPicture.asset('assets/icons/community_pet.svg');
      case AppPicutreAssetType.communityCamera:
        return SvgPicture.asset('assets/icons/community_camera.svg');

      case AppPicutreAssetType.communityKeyboardDown:
        return SvgPicture.asset('assets/icons/community_keyboard_down.svg');
      case AppPicutreAssetType.delete:
        return SvgPicture.asset('assets/icons/delete.svg');
      case AppPicutreAssetType.celebration:
        return Image.asset('assets/icons/celebration.png');
      case AppPicutreAssetType.checkCircle:
        return SvgPicture.asset('assets/icons/check_circle.svg');
      case AppPicutreAssetType.unCheckCircle:
        return SvgPicture.asset('assets/icons/uncheck_circle.svg');
    }
  }
}
