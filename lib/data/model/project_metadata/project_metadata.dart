import 'package:shinas_koya_portfolio/domain/constants/project_constants/project_constant_keys.dart';

class ProjectMetadataModel {
  final String key;
  final String englishTitle;
  final String kannadaTitle;
  final String category;
  final String icon;
  final String thumbnailImage;
  final bool isFeatured;
  final String? subTitle; // Only featured projects have this

  ProjectMetadataModel({
    required this.key,
    required this.englishTitle,
    required this.kannadaTitle,
    required this.category,
    required this.icon,
    required this.thumbnailImage,
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
      isFeatured: isFeatured,
      subTitle: json.containsKey(ProjectMetadataConstantKey.subTitle)
          ? json[ProjectMetadataConstantKey.subTitle]
          : null,
    );
  }
}
