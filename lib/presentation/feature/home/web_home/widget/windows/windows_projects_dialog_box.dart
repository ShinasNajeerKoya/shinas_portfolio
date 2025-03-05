import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class WindowsProjectsDialogBox extends StatelessWidget {
  final WebHomeBloc? bloc;

  const WindowsProjectsDialogBox({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
        return false;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: SingleChildScrollView(
          // padding: EdgeInsets.zero,
          child: Container(
            height: 300.h,
            width: 650.w,
            // padding: horizontalPadding8,
            decoration: BoxDecoration(
              color: AppColors.kMacPrimaryDarkColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: AppColors.kMacPrimaryDarkFontColor.withOpacity(0.5),
                width: 0.1.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Adjust shadow color and opacity
                  blurRadius: 10.r, // Controls the softness of the shadow
                  spreadRadius: 4.r, // How far the shadow spreads
                  offset: const Offset(2, 4), // Position of the shadow (X, Y)
                ),
              ],
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // verticalMargin4,

                /// **App bar section**
                // MacDialogAppBar(
                //   bloc: bloc,
                //   title: '',
                //   titlePadding: 52,
                // ),
                StreamBuilder<bool>(
                    stream: bloc!.isMouseHovered,
                    builder: (context, mouseHoveredSnapshot) {
                      final isHovered = mouseHoveredSnapshot.data ?? false;

                      return SizedBox(
                        height: 30,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            const Spacer(),

                            MouseRegion(
                              onEnter: (_) => bloc!.isMouseHovered.add(true),
                              onExit: (_) => bloc!.isMouseHovered.add(false),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: isHovered ? Colors.red : Colors.transparent,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.r)),
                                  ),
                                  child: const Icon(
                                    CupertinoIcons.clear,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                            /*
                            MacOSButton(
                              onTap: () {
                                Navigator.of(context).pop();
                                bloc!.appBarTitleValue.add('Finder');
                              },
                              color: Colors.red,
                              icon: AppIcons.kCancelIcon,
                              iconColor: Colors.black,
                              isHovered: isHovered,
                            ),*/
                            // const SizedBox(width: 6),
                            // MacOSButton(
                            //   color: Colors.yellow,
                            //   isHovered: isHovered,
                            // ),
                            // const SizedBox(width: 6),
                            // MacOSButton(
                            //   color: Colors.green,
                            //   isHovered: isHovered,
                            // ),
                            // const Spacer(),
                            // CustomText(
                            //   title,
                            //   fontSize: 12,
                            //   fontWeight: FontWeight.bold,
                            // ),
                            // const Spacer(),
                            // SizedBox(
                            //   width: titlePadding ?? 44,
                            // )
                          ],
                        ),
                      );
                    }),
                verticalMargin16,
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText('Projects will be updated here soon. -- for windows'),
                  ],
                ),
                const Spacer(),

                /// **Profile Image**
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const CircleAvatar(
                //       radius: 30,
                //       backgroundColor: Colors.transparent,
                //       backgroundImage: AssetImage(AppImages.kMacOsBg),
                //     ),
                //     horizontalMargin8,
                //     const Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         CustomText(
                //           'Shinas Najeer Koya',
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         CustomText(
                //           'Flutter Engineer',
                //           fontSize: 14,
                //           // fontWeight: FontWeight.bold,
                //           fontColor: Colors.grey,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // verticalMargin12,

                /// **contact icons list**

                // SizedBox(
                //   height: 60,
                //   width: 250,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: List.generate(contactOptions.length, (index) {
                //       final option = contactOptions[index];
                //       return ContactOptionColumn(
                //         title: option['title'],
                //         icon: option['icon'],
                //         tooltip: option['tooltip'],
                //       );
                //     }),
                //   ),
                // ),

                /// **Experience**

                // StreamBuilder<bool>(
                //   stream: bloc!.isContactPhoneHovered,
                //   builder: (context, mouseHoveredSnapshot) {
                //     final isHovered = mouseHoveredSnapshot.data ?? false;
                //     return DetailsRow(
                //       onEnter: (_) => bloc!.isContactPhoneHovered.add(true),
                //       onExit: (_) => bloc!.isContactPhoneHovered.add(false),
                //       title: 'Phone',
                //       value: '+91 8088 670 650',
                //       isHovered: isHovered,
                //     );
                //   },
                // ),
                // const CustomContactDivider(),
                // StreamBuilder<bool>(
                //   stream: bloc!.isContactEmailHovered,
                //   builder: (context, mouseHoveredSnapshot) {
                //     final isHovered = mouseHoveredSnapshot.data ?? false;
                //     return DetailsRow(
                //       onEnter: (_) => bloc!.isContactEmailHovered.add(true),
                //       onExit: (_) => bloc!.isContactEmailHovered.add(false),
                //       title: 'Email',
                //       // value: 'shinasnajeerkoya@gmail.com',
                //       value: DetailsConstantValues.email,
                //       isHovered: isHovered,
                //     );
                //   },
                // ),
                // const CustomContactDivider(),
                // StreamBuilder<bool>(
                //   stream: bloc!.isContactWebsiteHovered,
                //   builder: (context, mouseHoveredSnapshot) {
                //     final isHovered = mouseHoveredSnapshot.data ?? false;
                //     return DetailsRow(
                //       onEnter: (_) => bloc!.isContactWebsiteHovered.add(true),
                //       onExit: (_) => bloc!.isContactWebsiteHovered.add(false),
                //       title: 'Website',
                //       // value: 'null null',
                //       value: DetailsConstantValues.websiteUrl,
                //       isHovered: isHovered,
                //     );
                //   },
                // ),
                //
                // verticalMargin16,

                /// **Skills Section**

                // SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // const Spacer(),
                //     Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                //       decoration: BoxDecoration(
                //         color: AppColors.kDialogButtonColor,
                //         borderRadius: BorderRadius.circular(4),
                //       ),
                //       child: Center(
                //         child: CustomTextButton(
                //           'About Me',
                //           onTap: () {
                //             Navigator.of(context).pop();
                //             bloc!.appBarTitleValue.add(MenuItemsConstantKeys.aboutMe);
                //
                //             bloc!.showCustomDialog(
                //               // context: navigatorKey.currentContext!,
                //               context: context,
                //               bloc: bloc,
                //               title: MenuItemsConstantKeys.aboutMe,
                //               // subTitle: 'sub title',
                //             );
                //           },
                //           fontSize: 13,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // verticalMargin8,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
