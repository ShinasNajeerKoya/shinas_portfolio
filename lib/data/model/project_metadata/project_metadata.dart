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
      key: json['key'],
      englishTitle: json['englishTitle'],
      kannadaTitle: json['kannadaTitle'],
      category: json['category'],
      icon: json['icon'],
      thumbnailImage: json['thumbnailImage'],
      isFeatured: isFeatured,
      subTitle: json.containsKey('subTitle') ? json['subTitle'] : null,
    );
  }
}
