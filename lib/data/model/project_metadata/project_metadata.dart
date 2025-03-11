// import 'package:shinas_koya_portfolio/domain/constants/project_constants/project_constant_keys.dart';
//
// class ProjectMetadataModel {
//   final String key;
//   final String englishTitle;
//   final String kannadaTitle;
//   final String category;
//   final String icon;
//   final String thumbnailImage;
//   final bool isFeatured;
//   final String? subTitle; // Only featured projects have this
//
//   ProjectMetadataModel({
//     required this.key,
//     required this.englishTitle,
//     required this.kannadaTitle,
//     required this.category,
//     required this.icon,
//     required this.thumbnailImage,
//     this.isFeatured = false,
//     this.subTitle,
//   });
//
//   factory ProjectMetadataModel.fromJson(Map<String, dynamic> json, {bool isFeatured = false}) {
//     return ProjectMetadataModel(
//       key: json[ProjectMetadataConstantKey.key],
//       englishTitle: json[ProjectMetadataConstantKey.englishTitle],
//       kannadaTitle: json[ProjectMetadataConstantKey.kannadaTitle],
//       category: json[ProjectMetadataConstantKey.category],
//       icon: json[ProjectMetadataConstantKey.icon],
//       thumbnailImage: json[ProjectMetadataConstantKey.thumbnailImage],
//       isFeatured: isFeatured,
//       subTitle: json.containsKey(ProjectMetadataConstantKey.subTitle)
//           ? json[ProjectMetadataConstantKey.subTitle]
//           : null,
//     );
//   }
// }

import 'package:shinas_koya_portfolio/domain/constants/project_constants/project_constant_keys.dart';

class ProjectMetadataModel {
  final String key;
  final String englishTitle;
  final String kannadaTitle;
  final String category;
  final String icon;
  final String thumbnailImage;
  final String categoryIcon;
  final String presentIosUrl;
  final String presentAndroidUrl;
  final String appDevelopmentDuration;
  final String appDescriptionSmall;
  final String appDescriptionLarge;
  final List<String> appPreviewImages;
  final String role;
  final String client;
  final int teamSize;
  final String duration;
  final String language;
  final String languageCode;
  final String country;
  final String countryCode;
  final List<String> platformIcons;
  final bool isFeatured;
  final String? subTitle;

  ProjectMetadataModel({
    required this.key,
    required this.englishTitle,
    required this.kannadaTitle,
    required this.category,
    required this.icon,
    required this.thumbnailImage,
    required this.categoryIcon,
    required this.presentIosUrl,
    required this.presentAndroidUrl,
    required this.appDevelopmentDuration,
    required this.appDescriptionSmall,
    required this.appDescriptionLarge,
    required this.appPreviewImages,
    required this.role,
    required this.client,
    required this.teamSize,
    required this.duration,
    required this.language,
    required this.languageCode,
    required this.country,
    required this.countryCode,
    required this.platformIcons,
    this.isFeatured = false,
    this.subTitle,
  });

  factory ProjectMetadataModel.fromJson(Map<String, dynamic> json, {bool isFeatured = false}) {
    return ProjectMetadataModel(
      key: json[ProjectMetadataConstantKey.key],
      englishTitle: json[ProjectMetadataConstantKey.englishTitle],
      kannadaTitle: json[ProjectMetadataConstantKey.kannadaTitle],
      category: json[ProjectMetadataConstantKey.category],
      icon: json[ProjectMetadataConstantKey.icon],
      thumbnailImage: json[ProjectMetadataConstantKey.thumbnailImage],
      categoryIcon: json[ProjectMetadataConstantKey.categoryIcon],
      presentIosUrl: json[ProjectMetadataConstantKey.presentIosUrl],
      presentAndroidUrl: json[ProjectMetadataConstantKey.presentAndroidUrl],
      appDevelopmentDuration: json[ProjectMetadataConstantKey.appDevelopmentDuration],
      appDescriptionSmall: json[ProjectMetadataConstantKey.appDescriptionSmall],
      appDescriptionLarge: json[ProjectMetadataConstantKey.appDescriptionLarge],
      appPreviewImages: List<String>.from(json[ProjectMetadataConstantKey.appPreviewImages] ?? []),
      role: json[ProjectMetadataConstantKey.role],
      client: json[ProjectMetadataConstantKey.client],
      teamSize: json[ProjectMetadataConstantKey.teamSize] ?? 0,
      duration: json[ProjectMetadataConstantKey.duration],
      language: json[ProjectMetadataConstantKey.language],
      languageCode: json[ProjectMetadataConstantKey.languageCode],
      country: json[ProjectMetadataConstantKey.country],
      countryCode: json[ProjectMetadataConstantKey.countryCode],
      platformIcons: List<String>.from(json[ProjectMetadataConstantKey.platformIcons] ?? []),
      isFeatured: isFeatured,
      subTitle: json[ProjectMetadataConstantKey.subTitle],
    );
  }
}
