import 'package:hive/hive.dart';
import 'package:shinas_koya_portfolio/domain/constants/project_constants/project_constant_keys.dart';

part 'project_metadata.g.dart'; // Required for Hive

@HiveType(typeId: 0)
class ProjectMetadata {
  @HiveField(0)
  final String key;

  @HiveField(1)
  final String englishTitle;

  @HiveField(2)
  final String kannadaTitle;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final String? subTitle; // Only for featured projects

  @HiveField(5)
  final String icon;

  @HiveField(6)
  final String thumbnailImage;

  ProjectMetadata({
    required this.key,
    required this.englishTitle,
    required this.kannadaTitle,
    required this.category,
    this.subTitle,
    required this.icon,
    required this.thumbnailImage,
  });

  // Convert JSON to Model
  factory ProjectMetadata.fromJson(Map<String, dynamic> json) {
    return ProjectMetadata(
      key: json[ProjectMetadataConstantKey.key],
      englishTitle: json[ProjectMetadataConstantKey.englishTitle],
      kannadaTitle: json[ProjectMetadataConstantKey.kannadaTitle],
      category: json[ProjectMetadataConstantKey.category],
      subTitle: json[ProjectMetadataConstantKey.subTitle],
      icon: json[ProjectMetadataConstantKey.icon],
      thumbnailImage: json[ProjectMetadataConstantKey.thumbnailImage],
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      ProjectMetadataConstantKey.key: key,
      ProjectMetadataConstantKey.englishTitle: englishTitle,
      ProjectMetadataConstantKey.kannadaTitle: kannadaTitle,
      ProjectMetadataConstantKey.category: category,
      ProjectMetadataConstantKey.subTitle: subTitle,
      ProjectMetadataConstantKey.icon: icon,
      ProjectMetadataConstantKey.thumbnailImage: thumbnailImage,
    };
  }
}
