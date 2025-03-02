import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

class MacBottomBarHelper {
  static String getBottomBarTooltip(MacBottomBarEnum bottomOption) {
    switch (bottomOption) {
      case MacBottomBarEnum.phone:
        return "Call me";
      case MacBottomBarEnum.website:
        return "Visit my website";
      case MacBottomBarEnum.email:
        return "Send me an email";
      case MacBottomBarEnum.project:
        return "Visit my projects";
      case MacBottomBarEnum.meet:
        return "Let's schedule";
      case MacBottomBarEnum.settings:
        return "Open setting";
      case MacBottomBarEnum.contact:
        return "Contact me";
    }
  }

  ///

  static String getBottomOptionIcon(MacBottomBarEnum bottomOption) {
    switch (bottomOption) {
      case MacBottomBarEnum.phone:
        return AppIcons.kPhoneMacIcon;
      case MacBottomBarEnum.website:
        return AppIcons.kWebsiteMacIcon;
      case MacBottomBarEnum.email:
        return AppIcons.kMailMacIcon;
      case MacBottomBarEnum.project:
        return AppIcons.kFlutterMacIcon;
      case MacBottomBarEnum.meet:
        return AppIcons.kFlappyBirdMacIcon;
      case MacBottomBarEnum.settings:
        return AppIcons.kSettingsMacIcon;
      case MacBottomBarEnum.contact:
        return AppIcons.kContactMacIcon;
    }
  }

  ///

  static void Function()? getBottomOptionOnTap({
    required MacBottomBarEnum bottomOption,
    required WebHomeBloc? bloc,
    required BuildContext context,
  }) {
    switch (bottomOption) {
      case MacBottomBarEnum.phone:
        return () => ContactService.handleCall(context);
      case MacBottomBarEnum.website:
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.website);
      case MacBottomBarEnum.email:
        return () => ContactService.handleEmail();
      case MacBottomBarEnum.project:
        return () {
          bloc!.appBarTitleValue.add(MenuItemsConstantKeys.projects);

          bloc.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.projects,
          );
        };
      case MacBottomBarEnum.meet:
        // return () {
        //   bloc!.showFeatureComingSoonSnackbar(
        //     context: context,
        //   );
        // };
        return () => ContactService.handleWeb(SocialMediaPlatformEnum.scheduleMeeting);

      case MacBottomBarEnum.settings:
        return () {
          bloc!.showFeatureComingSoonSnackbar(
            context: context,
          );
        };
      case MacBottomBarEnum.contact:
        return () {
          bloc!.appBarTitleValue.add(MenuItemsConstantKeys.contact);

          bloc.showCustomDialog(
            context: context,
            bloc: bloc,
            title: MenuItemsConstantKeys.contact,
          );
        }; // case MainLayoutEnum.settings:
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
