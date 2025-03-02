import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

class DesktopLayoutHelper {
  static String getMainLayoutTitle(MainLayoutEnum layout, bool isMacOs) {
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
      case MainLayoutEnum.windowsOrMac:
        return isMacOs ? "Windows" : "MacOS Mode";
    }
  }

  ///

  static String getMacLayoutIcon(MainLayoutEnum layout) {
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
      case MainLayoutEnum.windowsOrMac:
        return AppIcons.kWindowsMacIcon;
    }
  }

  ///

  static String getWindowsLayoutIcon(MainLayoutEnum layout) {
    switch (layout) {
      case MainLayoutEnum.projects:
        return AppIcons.kFlutterWindowsIcon;
      case MainLayoutEnum.packages:
        return AppIcons.kDartWindowsIcon;
      case MainLayoutEnum.resume:
        return AppIcons.kResumeWindowsIcon;
      case MainLayoutEnum.github:
        return AppIcons.kGithubWindowsIcon;
      case MainLayoutEnum.linkedin:
        return AppIcons.kLinkedInWindowsIcon;
      case MainLayoutEnum.fullscreen:
        return AppIcons.kFullscreenWindowsIcon;
      case MainLayoutEnum.flappyBird:
        return AppIcons.kFlappyBirdWindowsIcon;
      // case MainLayoutEnum.settings:
      //   return AppIcons.kSettingsMacIcon;
      case MainLayoutEnum.figma:
        return AppIcons.kFigmaWindowsIcon;
      case MainLayoutEnum.windowsOrMac:
        return AppIcons.kMacSwitchWindowsIcon;
    }
  }

  ///

  static void Function()? getMainLayoutOnTap({
    required MainLayoutEnum layoutEnum,
    required WebHomeBloc? bloc,
    required BuildContext context,
  }) {
    switch (layoutEnum) {
      case MainLayoutEnum.projects:
        return () {
          bloc!.appBarTitleValue.add(MenuItemsConstantKeys.projects);

          bloc.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.projects,
          );
        };
      case MainLayoutEnum.packages:
        return () {
          bloc!.showFeatureComingSoonSnackbar(
            context: context,
          );
        };
      case MainLayoutEnum.resume:
        return () => debugPrint("Open Resume");
      case MainLayoutEnum.github:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.github);
      case MainLayoutEnum.linkedin:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.linkedIn);
      case MainLayoutEnum.fullscreen:
        return () {
          debugPrint("Full Screen Tapped");
          bloc!.toggleFullScreen();
        };
      case MainLayoutEnum.flappyBird:
        return () {
          bloc!.showFeatureComingSoonSnackbar(
            context: context,
          );
        }; // case MainLayoutEnum.settings:
      //   return () => debugPrint("Open Settings");
      case MainLayoutEnum.figma:
        return () {
          bloc!.showFeatureComingSoonSnackbar(
            context: context,
          );
        };
      case MainLayoutEnum.windowsOrMac:
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
      // case MainLayoutEnum.figma:
      //   return '2';
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
