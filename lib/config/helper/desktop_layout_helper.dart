import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

class DesktopLayoutHelper {
  static String getMainLayoutTitle(MainLayoutEnum layout) {
    switch (layout) {
      case MainLayoutEnum.projects:
        return "Projects";
      case MainLayoutEnum.packages:
        return "Packages";
      case MainLayoutEnum.resume:
        return "Resume";
      case MainLayoutEnum.github:
        return "GitHub";
      case MainLayoutEnum.linkedin:
        return "LinkedIn";
      case MainLayoutEnum.fullscreen:
        return "Fullscreen";
      case MainLayoutEnum.flappyBird:
        return "Flappy Bird";
      // case MainLayoutEnum.settings:
      //   return "Settings";
      case MainLayoutEnum.figma:
        return "Figma";
      case MainLayoutEnum.windows:
        return "Windows";
    }
  }

  ///

  static String getMainLayoutIcon(MainLayoutEnum layout) {
    switch (layout) {
      case MainLayoutEnum.projects:
        return AppIcons.kFlutterMacIcon;
      case MainLayoutEnum.packages:
        return AppIcons.kDartMacIcon;
      case MainLayoutEnum.resume:
        return AppIcons.kResumeMacIcon;
      case MainLayoutEnum.github:
        return AppIcons.kGithubMacIcon;
      case MainLayoutEnum.linkedin:
        return AppIcons.kLinkedInMacIcon;
      case MainLayoutEnum.fullscreen:
        return AppIcons.kFullScreenMacIcon;
      case MainLayoutEnum.flappyBird:
        return AppIcons.kFlappyBirdMacIcon;
      // case MainLayoutEnum.settings:
      //   return AppIcons.kSettingsMacIcon;
      case MainLayoutEnum.figma:
        return AppIcons.kFigmaMacIcon;
      case MainLayoutEnum.windows:
        return AppIcons.kWindowsMacIcon;
    }
  }

  ///

  static void Function()? getMainLayoutOnTap(
      {required MainLayoutEnum layoutEnum, required WebHomeBloc? bloc}) {
    switch (layoutEnum) {
      case MainLayoutEnum.projects:
        return () => debugPrint("Open Projects");
      case MainLayoutEnum.packages:
        return () => debugPrint("Open Packages");
      case MainLayoutEnum.resume:
        return () => debugPrint("Open Resume");
      case MainLayoutEnum.github:
        return () => debugPrint("Open GitHub Profile");
      case MainLayoutEnum.linkedin:
        return () => debugPrint("Open LinkedIn Profile");
      case MainLayoutEnum.fullscreen:
        return () => debugPrint("Toggle Fullscreen");
      case MainLayoutEnum.flappyBird:
        return () => debugPrint("Launch Flappy Bird Game");
      // case MainLayoutEnum.settings:
      //   return () => debugPrint("Open Settings");
      case MainLayoutEnum.figma:
        return () => debugPrint("Open Figma");
      case MainLayoutEnum.windows:
        return () => bloc!.togglePlatform();
    }
  }

  ///

  static String? getNotificationCount(MainLayoutEnum layout) {
    switch (layout) {
      case MainLayoutEnum.projects:
        return '10+';
      case MainLayoutEnum.github:
        return '13+';
      case MainLayoutEnum.linkedin:
        return '2k+';
      case MainLayoutEnum.figma:
        return '2';
      // case MainLayoutEnum.flappyBird:
      //   return '10+';
      default:
        return null;
    }
  }

  ///

  /// Returns whether the arrow mark should be shown.
  static bool shouldShowArrow(MainLayoutEnum layout) {
    return layout == MainLayoutEnum.projects ||
        layout == MainLayoutEnum.github ||
        layout == MainLayoutEnum.linkedin;
  }
}
