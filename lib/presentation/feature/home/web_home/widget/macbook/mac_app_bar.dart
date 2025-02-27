import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_icon_button.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text_button.dart';

class MacAppBar extends StatelessWidget {
  final WebHomeBloc? bloc;

  MacAppBar({
    super.key,
    required this.bloc,
  });

  final List<Map<String, dynamic>> menuItems = [
    {"title": "About Me", "color": Colors.red},
    {"title": "Contact", "color": Colors.blue},
    {"title": "Projects", "color": Colors.green},
  ];

  // void _showDialog(String title, Color color) {
  //   setState(() {
  //     activeTitle = title; // Update app bar title
  //   });
  //
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // Prevent closing on tap outside
  //     builder: (context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8.r),
  //         ),
  //         child: Container(
  //           width: 100.w,
  //           height: 100.h,
  //           color: color,
  //           child: Stack(
  //             children: [
  //               Center(
  //                 child: CustomText(
  //                   title,
  //                   fontSize: 8.sp,
  //                   fontWeight: FontWeight.w600,
  //                   fontColor: Colors.white,
  //                 ),
  //               ),
  //               Positioned(
  //                 top: 8.h,
  //                 right: 8.w,
  //                 child: IconButton(
  //                   icon: Icon(Icons.close, color: Colors.white),
  //                   onPressed: () {
  //                     Navigator.of(context).pop(); // Close dialog
  //                     // setState(() {
  //                     //   activeTitle = "Finder"; // Reset title
  //                     // });
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CustomBackdropFilter(
      borderRadius: 0.r,
      height: 12.h,
      width: double.maxFinite,
      borderColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
        child: Row(
          children: [
            CustomIconButton(
              icon: AppIcons.kAppleLogo,
              onTap: () {
                log('iOS logo tapped');
                bloc!.appBarTitleValue.add('FinderV');
              },
            ),
            horizontalMargin12,
            StreamBuilder<String>(
                stream: bloc!.appBarTitleValue,
                builder: (context, titleSnapshot) {
                  final title = titleSnapshot.data ?? 'FinderB';

                  return CustomText(
                    title,
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w600,
                  );
                }),
            horizontalMargin8,

            ///
            // CustomTextButton(
            //   "About Me",
            //   onTap: () {
            //     log('About Me tapped');
            //   },
            //   fontSize: 7.sp,
            // ),
            // horizontalMargin8,
            // CustomTextButton(
            //   "Contact",
            //   onTap: () {
            //     log('Contact tapped');
            //   },
            //   fontSize: 7.sp,
            // ),
            // horizontalMargin8,
            // CustomTextButton(
            //   "Projects",
            //   onTap: () {
            //     log('projects tapped');
            //   },
            //   fontSize: 7.sp,
            // ),
            ...List.generate(menuItems.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: CustomTextButton(
                  menuItems[index][MenuItemsConstantKeys.title],
                  onTap: () {
                    bloc!.appBarTitleValue.add(menuItems[index][MenuItemsConstantKeys.title]);

                    ///
                    bloc!.showCustomDialog(
                      // context: navigatorKey.currentContext!,
                      context: context,
                      bloc:bloc,
                      title: menuItems[index][MenuItemsConstantKeys.title],
                      // subTitle: 'sub title',
                    );

                    ///
                  },
                  fontSize: 7.sp,
                ),
              );
            }),

            ///
            Spacer(),
            Container(
              width: 15.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: Center(
                child: CustomTextButton(
                  "EN",
                  fontColor: Colors.black,
                  onTap: () {
                    log('language selection button tapped');
                  },
                  fontSize: 7.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            horizontalMargin8,
            CustomText(
              DateFormat('E, MMM d, h:mm a').format(DateTime.now()),
              fontSize: 7.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
