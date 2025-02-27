import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/about_me_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/contact_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/projects_dialog_box.dart';

class MenuDialogFactory {
  static Widget getDialog(String title) {
    final dialogMap = <String, Widget Function()>{
      MenuItemsConstantKeys.aboutMe: () => AboutMeDialogBox(),
      MenuItemsConstantKeys.projects: () => ProjectsDialogBox(),
      MenuItemsConstantKeys.contact: () => ContactDialogBox(),
    };

    return dialogMap[title]?.call() ?? const SizedBox(); // Default to empty widget if no match
  }
}
