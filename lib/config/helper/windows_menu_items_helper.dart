import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

class WindowsMenuItemHelper {
  static String getWindowsMenuItemTitle(WindowsMenuItemsEnum menuItem) {
    switch (menuItem) {
      case WindowsMenuItemsEnum.projects:
        return "Projects";
      case WindowsMenuItemsEnum.figma:
        return "Figma";
      case WindowsMenuItemsEnum.github:
        return "Github";
      case WindowsMenuItemsEnum.linkedin:
        return "LinkedIn";
      case WindowsMenuItemsEnum.meet:
        return "Calendar";
    }
  }

  ///
  static String getWindowsMenuItemIcon(WindowsMenuItemsEnum menuItem) {
    switch (menuItem) {
      case WindowsMenuItemsEnum.projects:
        return AppIcons.kFlutterWindowsIcon;
      case WindowsMenuItemsEnum.figma:
        return AppIcons.kFigmaWindowsIcon;
      case WindowsMenuItemsEnum.github:
        return AppIcons.kGithubWindowsIcon;
      case WindowsMenuItemsEnum.linkedin:
        return AppIcons.kLinkedInWindowsIcon;
      case WindowsMenuItemsEnum.meet:
        return AppIcons.kCalendarWindowsIcon;
    }
  }

  ///

  static void Function()? getWindowsMenuItemOnTap({
    required WindowsMenuItemsEnum menuItem,
    required WebHomeBloc? bloc,
    required BuildContext context,
  }) {
    switch (menuItem) {
      case WindowsMenuItemsEnum.projects:
        return () {
          // bloc!.appBarTitleValue.add(MenuItemsConstantKeys.projects);

          bloc?.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.projects,
          );
        };
      case WindowsMenuItemsEnum.figma:
        return () {
          bloc!.showFeatureComingSoonSnackbar(
            context: context,
          );
        };
      case WindowsMenuItemsEnum.github:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.github);
      case WindowsMenuItemsEnum.linkedin:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.linkedIn);
      case WindowsMenuItemsEnum.meet:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.scheduleMeeting);
    }
  }

  ///

  static String? getWindowsMenuItemNotificationCount(WindowsMenuItemsEnum menuItem) {
    switch (menuItem) {
      case WindowsMenuItemsEnum.projects:
        return '10+';
      case WindowsMenuItemsEnum.figma:
        return 'New';
      case WindowsMenuItemsEnum.github:
        return '13+';
      case WindowsMenuItemsEnum.linkedin:
        return '2k+';
      // case MainLayoutEnum.flappyBird:
      //   return '10+';
      default:
        return null;
    }
  }
}
