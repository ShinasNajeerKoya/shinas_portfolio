import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shinas_koya_portfolio/config/utils/data_util.dart';
import 'package:shinas_koya_portfolio/data/model/project_details/project_details.dart';

class ProjectDetailsRepository {
  /// Fetches project details by key
  Future<ProjectDetails> fetchProjectDetails(String projectKey) async {
    try {
      // Load the JSON file from assets
      final String response = await rootBundle.loadString(ProjectData.kProjectDetailsData);
      final Map<String, dynamic> data = json.decode(response);

      // Check if the project exists in the JSON data
      if (!data.containsKey(projectKey)) {
        throw Exception("Project with key '$projectKey' not found.");
      }

      // Convert JSON to `ProjectDetails` object
      return ProjectDetails.fromJson(data[projectKey]);
    } catch (e) {
      throw Exception("Error fetching project details: $e");
    }
  }
}
