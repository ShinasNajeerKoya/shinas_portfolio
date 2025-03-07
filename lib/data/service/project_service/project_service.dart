import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:shinas_koya_portfolio/config/constants/hive_constants/hive_constant_keys.dart';
import 'package:shinas_koya_portfolio/config/utils/data_util.dart';
import 'package:shinas_koya_portfolio/data/dao/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/domain/constants/project_constants/project_constant_keys.dart';

class ProjectService {
  final Box<ProjectMetadata> _box = Hive.box<ProjectMetadata>(HiveConstantKeys.projectsBox);

  // Load JSON and Save to Hive
  Future<void> loadJsonToHive() async {
    try {
      String jsonString = await rootBundle.loadString(ProjectData.kProjectMetaData);
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      List<ProjectMetadata> projects = [];

      for (var project in jsonData[ProjectMetadataConstantKey.featuredProjects]) {
        projects.add(ProjectMetadata.fromJson(project));
      }

      for (var project in jsonData[ProjectMetadataConstantKey.normalProjects]) {
        projects.add(ProjectMetadata.fromJson(project));
      }

      await _box.clear(); // Clear old data before saving new data
      await _box.addAll(projects); // Save to Hive

      print("Projects saved to Hive successfully -- projects metadata value.");
    } catch (e) {
      print("Error loading JSON -- projects metadata value : $e");
    }
  }

  // Retrieve Data from Hive
  List<ProjectMetadata> getProjects() {
    return _box.values.toList();
  }
}
