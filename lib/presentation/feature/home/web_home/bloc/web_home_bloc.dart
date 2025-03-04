import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shinas_koya_portfolio/config/utils/misc_util.dart';

class WebHomeBloc {
  // final LocationRepository locationRepository;
  // final NotificationRepository notificationRepository;

  final splashSubject = BehaviorSubject<String>();
  final permissionDeniedSubject = BehaviorSubject<bool>.seeded(false);

  ///
  final isMacPlatform = BehaviorSubject<bool>.seeded(true);

  final appBarTitleValue = BehaviorSubject<String>.seeded('FinderV');

  final isMouseHovered = BehaviorSubject<bool>.seeded(false);

  /// about me
  final isExperienceHovered = BehaviorSubject<bool>.seeded(false);
  final isSkillsHovered = BehaviorSubject<bool>.seeded(false);

  /// contact
  final isContactPhoneHovered = BehaviorSubject<bool>.seeded(false);
  final isContactEmailHovered = BehaviorSubject<bool>.seeded(false);
  final isContactWebsiteHovered = BehaviorSubject<bool>.seeded(false);

  WebHomeBloc() {
    // initDetails();
  }

  void togglePlatform() {
    isMacPlatform.add(!isMacPlatform.value);
  }

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

    final dialog = MenuDialogFactory.getDialog(title: title, bloc: bloc);

    if (dialog is SizedBox) return;

    await showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  void dispose() {
    splashSubject.close();
    permissionDeniedSubject.close();
  }
}
