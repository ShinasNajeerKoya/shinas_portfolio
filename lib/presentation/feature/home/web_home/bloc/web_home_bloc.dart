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

  WebHomeBloc() {
    // initDetails();
  }

  void togglePlatform() {
    isMacPlatform.add(!isMacPlatform.value);
  }

  Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
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

    final dialog = MenuDialogFactory.getDialog(title);

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
