

class ProjectDetails {
  final String key;
  final String appIcon;
  final String appTitle;
  final String appCategory;
  final String categoryIcon;
  final String? presentIosUrl;
  final String? presentAndroidUrl;
  final String appDevelopmentDuration;
  final String appDescriptionSmall;
  final List<String> appPreviewImages;
  final String appDescriptionLarge;
  final String role;
  final String client;
  final int teamSize;
  final String duration;
  final String language;
  final String languageCode;
  final String country;
  final String countryCode;
  final List<String> platformIcons;

  ProjectDetails({
    required this.key,
    required this.appIcon,
    required this.appTitle,
    required this.appCategory,
    required this.categoryIcon,
    this.presentIosUrl,
    this.presentAndroidUrl,
    required this.appDevelopmentDuration,
    required this.appDescriptionSmall,
    required this.appPreviewImages,
    required this.appDescriptionLarge,
    required this.role,
    required this.client,
    required this.teamSize,
    required this.duration,
    required this.language,
    required this.languageCode,
    required this.country,
    required this.countryCode,
    required this.platformIcons,
  });

  /// Factory method to create an instance from JSON
  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      key: json['key'] ?? '',
      appIcon: json['app_icon'] ?? '',
      appTitle: json['app_title'] ?? '',
      appCategory: json['app_category'] ?? '',
      categoryIcon: json['category_icon'] ?? '',
      presentIosUrl: json['present_ios_url'],
      presentAndroidUrl: json['present_android_url'],
      appDevelopmentDuration: json['app_development_duration'] ?? '',
      appDescriptionSmall: json['app_description_small'] ?? '',
      appPreviewImages: List<String>.from(json['app_preview_images'] ?? []),
      appDescriptionLarge: json['app_description_large'] ?? '',
      role: json['role'] ?? '',
      client: json['client'] ?? '',
      teamSize: json['team_size'] ?? 0,
      duration: json['duration'] ?? '',
      language: json['language'] ?? '',
      languageCode: json['language_code'] ?? '',
      country: json['country'] ?? '',
      countryCode: json['country_code'] ?? '',
      platformIcons: List<String>.from(json['platform_icons'] ?? []),
    );
  }

  /// Method to convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "key": key,
      "app_icon": appIcon,
      "app_title": appTitle,
      "app_category": appCategory,
      "category_icon": categoryIcon,
      "present_ios_url": presentIosUrl,
      "present_android_url": presentAndroidUrl,
      "app_development_duration": appDevelopmentDuration,
      "app_description_small": appDescriptionSmall,
      "app_preview_images": appPreviewImages,
      "app_description_large": appDescriptionLarge,
      "role": role,
      "client": client,
      "team_size": teamSize,
      "duration": duration,
      "language": language,
      "language_code": languageCode,
      "country": country,
      "country_code": countryCode,
      "platform_icons": platformIcons,
    };
  }

// /// Convert a list of JSON objects to a Map of ProjectDetails
// static Map<String, ProjectDetails> mapFromJson(String jsonString) {
//   Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   return jsonData.map((key, value) => MapEntry(key, ProjectDetails.fromJson(value)));
// }
}
