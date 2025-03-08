import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shinas_koya_portfolio/config/utils/data_util.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';

class ProjectMetadataRepository {
  Future<List<ProjectMetadataModel>> fetchFeaturedProjects() async {
    try {
      final String response = await rootBundle.loadString(ProjectData.kProjectMetaData);
      final Map<String, dynamic> data = json.decode(response);

      return (data['featuredProjects'] as List?)
          ?.map((project) => ProjectMetadataModel.fromJson(project, isFeatured: true))
          .toList() ?? [];
    } catch (e) {
      throw Exception("Error fetching featured projects: $e");
    }
  }

  Future<List<ProjectMetadataModel>> fetchNormalProjects() async {
    try {
      final String response = await rootBundle.loadString(ProjectData.kProjectMetaData);
      final Map<String, dynamic> data = json.decode(response);

      return (data['normalProjects'] as List?)
          ?.map((project) => ProjectMetadataModel.fromJson(project))
          .toList() ?? [];
    } catch (e) {
      throw Exception("Error fetching normal projects: $e");
    }
  }
}
