import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shinas_koya_portfolio/config/utils/misc_util.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/domain/repository/project_metadata_repository/project_metadata_repository.dart';

enum MainLayoutEnum {
  projects,
  resume,
  packages,
  github,
  flappyBird,
  fullscreen,
  linkedin,
  // settings,
  figma,
  windowsOrMac,
}

enum MacBottomBarEnum {
  phone,
  website,
  email,
  project,
  meet,
  settings,
  contact,
}

enum WindowsBottomBarEnum {
  menu,
  website,
  project,
  mail,
  meet,
}

enum WindowsMenuItemsEnum {
  projects,
  figma,
  github,
  linkedin,
  meet,
}

class WebHomeBloc {
  // final LocationRepository locationRepository;
  // final NotificationRepository notificationRepository;

  final ProjectMetadataRepository projectMetadataRepository;

  //
  // final splashSubject = BehaviorSubject<String>();
  // final permissionDeniedSubject = BehaviorSubject<bool>.seeded(false);

  ///
  final isMacPlatform = BehaviorSubject<bool>.seeded(true);

  final appBarTitleValue = BehaviorSubject<String>.seeded('Finder');

  final isMouseHovered = BehaviorSubject<bool>.seeded(false);

  /// about me
  final isExperienceHovered = BehaviorSubject<bool>.seeded(false);
  final isSkillsHovered = BehaviorSubject<bool>.seeded(false);

  /// contact
  final isContactPhoneHovered = BehaviorSubject<bool>.seeded(false);
  final isContactEmailHovered = BehaviorSubject<bool>.seeded(false);
  final isContactWebsiteHovered = BehaviorSubject<bool>.seeded(false);

  /// windows menu items
  final isMenuContExpanded = BehaviorSubject<bool>.seeded(false);

  /// project metadata section
  // final BehaviorSubject<List<ProjectMetadataModel>> projectsMetadata =
  //     BehaviorSubject<List<ProjectMetadataModel>>();

  final featuredProjects = BehaviorSubject<List<ProjectMetadataModel>>();
  final normalProjects = BehaviorSubject<List<ProjectMetadataModel>>();

  WebHomeBloc({required this.projectMetadataRepository}) {
    // initDetails();

    // fetchProjectMetadata();
    fetchProjectsMetadataFromJson();
  }

  void togglePlatform() {
    isMacPlatform.add(!isMacPlatform.value);
  }

  /// logic to fetch the projects listing data
  /// Fetch projects from JSON file

  Future<void> fetchProjectsMetadataFromJson() async {
    // try {
    //
    //   // Load the JSON file from assets
    //   final String response = await rootBundle.loadString(ProjectData.kProjectMetaData);
    //
    //   // Decode the JSON data
    //   final Map<String, dynamic> data = json.decode(response);
    //
    //   // Extract featured projects
    //   List<ProjectMetadataModel> featuredProjects = (data['featuredProjects'] as List?)
    //       ?.map((project) => ProjectMetadataModel.fromJson(project, isFeatured: true))
    //       .toList() ??
    //       [];
    //
    //   // Extract normal projects
    //   List<ProjectMetadataModel> normalProjects = (data['normalProjects'] as List?)
    //       ?.map((project) => ProjectMetadataModel.fromJson(project))
    //       .toList() ??
    //       [];
    //
    //   // Combine and add to the stream
    //   List<ProjectMetadataModel> allProjects = [...featuredProjects, ...normalProjects];
    //   projectsMetadata.add(allProjects);
    //
    //   return allProjects;
    // } catch (e) {
    //   debugPrint("Error loading projects: $e");
    //   projectsMetadata.addError("Failed to load projects");
    //
    //   return [];
    // }

    try {
      final featured = await projectMetadataRepository.fetchFeaturedProjects();
      featuredProjects.add(featured);

      final normal = await projectMetadataRepository.fetchNormalProjects();
      normalProjects.add(normal);
    } catch (e) {
      featuredProjects.addError("Failed to load featured projects");
      normalProjects.addError("Failed to load normal projects");
    }
  }

  ///

  Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required WebHomeBloc? bloc,
    // required String subTitle,
  }) async {
    // await showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return CustomDialogBox(
    //       title: title,
    //       // subTitle: subTitle,
    //     );
    //   },
    // );

    final dialog = MenuDialogFactory.getDialogBox(title: title, bloc: bloc);

    if (dialog is SizedBox) return;

    await showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  void showFeatureComingSoonSnackbar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("This feature will be available in the future soon."),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void toggleFullScreen() {
    if (html.document.fullscreenElement == null) {
      html.document.documentElement?.requestFullscreen();
    } else {
      html.document.exitFullscreen();
    }
  }

  void dispose() {
    // splashSubject.close();
    // permissionDeniedSubject.close();
  }
}

// void fetchProjectMetadata() async {
//   List<ProjectMetadata> projects = [];
//
//
//   if (kIsWeb) {
//     // Fetch from JSON file directly in Web
//     projects = await ProjectService().fetchProjectsFromJson();
//   } else {
//     // Fetch from Hive in Mobile/Desktop
//     final Box<ProjectMetadata> box = Hive.box<ProjectMetadata>(HiveConstantKeys.projectsBox);
//     // return box.values.toList();
//     projects = box.values.toList();
//   }
//
//   projectsMetadata.add(projects);
// }
