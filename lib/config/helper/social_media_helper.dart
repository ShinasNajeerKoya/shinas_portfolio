import 'package:shinas_koya_portfolio/config/constants/details_constants.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';

class SocialMediaHelper {
  //
  static String getSocialMediaUrl(SocialMediaPlatformEnum platformType) {
    switch (platformType) {
      case SocialMediaPlatformEnum.website:
        return DetailsConstantValues.websiteUrl;
      case SocialMediaPlatformEnum.linkedIn:
        return DetailsConstantValues.linkedInUrl;
      case SocialMediaPlatformEnum.github:
        return DetailsConstantValues.githubUrl;
      // case SocialMediaPlatformEnum.figma:
      //   return DetailsConstantValues.portfolioUrl; // Assuming portfolioUrl is used for Figma
      default:
        return '';
    }
  }
}
