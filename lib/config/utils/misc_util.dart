import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/about_me_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/contact_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_projects_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/windows/windows_menu_widget.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/windows/windows_projects_dialog_box.dart';

class MenuDialogFactory {
  static Widget getDialogBox({required String title, required WebHomeBloc? bloc}) {
    final dialogMap = <String, Widget Function()>{
      MenuItemsConstantKeys.aboutMe: () => AboutMeDialogBox(bloc: bloc),
      MenuItemsConstantKeys.projects: () =>
          bloc!.isMacPlatform.value ? MacProjectsDialogBox(bloc: bloc) : WindowsProjectsDialogBox(bloc: bloc),
      MenuItemsConstantKeys.contact: () => ContactDialogBox(bloc: bloc),
      MenuItemsConstantKeys.menu: () => WindowsMenuWidget(bloc: bloc),
    };

    return dialogMap[title]?.call() ?? const SizedBox(); // Default to empty widget if no match
  }

// static Widget getWindowsDialog({required String title, required WebHomeBloc? bloc}) {
//   final dialogMap = <String, Widget Function()>{
//     MenuItemsConstantKeys.aboutMe: () => AboutMeDialogBox(bloc: bloc),
//     MenuItemsConstantKeys.projects: () => ProjectsDialogBox(bloc: bloc),
//     MenuItemsConstantKeys.contact: () => ContactDialogBox(bloc: bloc),
//   };
//
//   return dialogMap[title]?.call() ?? const SizedBox(); // Default to empty widget if no match
// }
}
