import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

class WindowsBottomBarHelper {
  static String getBottomBarTooltip(WindowsBottomBarEnum bottomOption) {
    switch (bottomOption) {
      case WindowsBottomBarEnum.menu:
        return "Open menu";
      case WindowsBottomBarEnum.website:
        return "Visit my website";
      case WindowsBottomBarEnum.project:
        return "Visit my projects";
      case WindowsBottomBarEnum.mail:
        return "Send me an email";
      case WindowsBottomBarEnum.meet:
        return "Let's schedule";
    }
  }

  ///

  static String getBottomOptionIcon(WindowsBottomBarEnum bottomOption) {
    switch (bottomOption) {
      case WindowsBottomBarEnum.menu:
        return AppIcons.kMenuWindowsIcon;
      case WindowsBottomBarEnum.website:
        return AppIcons.kEdgeWindowsIcon;
      case WindowsBottomBarEnum.project:
        return AppIcons.kFlutterWindowsIcon;
      case WindowsBottomBarEnum.mail:
        return AppIcons.kMailWindowsIcon;
      case WindowsBottomBarEnum.meet:
        return AppIcons.kCalendarWindowsIcon;
    }
  }

  ///

  static void Function()? getBottomOptionOnTap({
    required WindowsBottomBarEnum bottomOption,
    required WebHomeBloc? bloc,
    required BuildContext context,
  }) {
    switch (bottomOption) {
      case WindowsBottomBarEnum.menu:
        return () {
          bloc?.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.menu,
          );
        };

      case WindowsBottomBarEnum.website:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.website);

      case WindowsBottomBarEnum.project:
        return () {
          bloc!.appBarTitleValue.add(MenuItemsConstantKeys.projects);

          bloc.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.projects,
          );
        };

      case WindowsBottomBarEnum.mail:
        return () => ContactService.handleEmail();

      case WindowsBottomBarEnum.meet:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.scheduleMeeting);
    }
  }
}
