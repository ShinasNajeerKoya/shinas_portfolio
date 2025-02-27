import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_os_button.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text_button.dart';

class ProjectsDialogBox extends StatelessWidget {
  final WebHomeBloc? bloc;

  const ProjectsDialogBox({
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
        child: Container(
          height: 220.h,
          width: 200.w,
          padding: horizontalPadding8,
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
              verticalMargin4,

              StreamBuilder<bool>(
                  stream: bloc!.isMouseHovered,
                  builder: (context, mouseHoveredSnapshot) {
                    final isHovered = mouseHoveredSnapshot.data ?? false;

                    return MouseRegion(
                      onEnter: (_) => bloc!.isMouseHovered.add(true),
                      onExit: (_) => bloc!.isMouseHovered.add(false),
                      child: SizedBox(
                        height: 16,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            MacOSButton(
                              onTap: () {
                                Navigator.of(context).pop();
                                bloc!.appBarTitleValue.add('FinderV');
                              },
                              color: Colors.red,
                              icon: AppIcons.kCancelIcon,
                              iconColor: Colors.black,
                              isHovered: isHovered,
                            ),
                            horizontalMargin4,
                            MacOSButton(
                              color: Colors.yellow,
                              isHovered: isHovered,
                            ),
                            horizontalMargin4,
                            MacOSButton(
                              color: Colors.green,
                              isHovered: isHovered,
                            ),
                            const Spacer(),
                            const CustomText(
                              "About Me",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 40.w,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              verticalMargin16,

              /// **Profile Image**
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(AppImages.kMacOsBg),
              ),
              verticalMargin12,

              const CustomText(
                'Shinas Najeer Koya',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

              const CustomText(
                'Flutter Engineer',
                fontSize: 14,
                // fontWeight: FontWeight.bold,
                fontColor: Colors.grey,
              ),

              verticalMargin12,

              /// **Experience**

              // StreamBuilder<bool>(
              //   stream: bloc!.isExperienceHovered,
              //   builder: (context, mouseHoveredSnapshot) {
              //     final isHovered = mouseHoveredSnapshot.data ?? false;
              //     return DetailsRow(
              //       onEnter: (_) => bloc!.isExperienceHovered.add(true),
              //       onExit: (_) => bloc!.isExperienceHovered.add(false),
              //       title: 'Experience',
              //       value: '3+ years',
              //       isHovered: isHovered,
              //     );
              //   },
              // ),

              verticalMargin8,

              /// **Skills Section**
              // StreamBuilder<bool>(
              //   stream: bloc!.isSkillsHovered,
              //   builder: (context, mouseHoveredSnapshot) {
              //     final isHovered = mouseHoveredSnapshot.data ?? false;
              //     return DetailsRow(
              //       onEnter: (_) => bloc!.isSkillsHovered.add(true),
              //       onExit: (_) => bloc!.isSkillsHovered.add(false),
              //       title: 'Skills',
              //       value:
              //       'Flutter, Dart \nFirebase, Supabase \nREST, Git\nFlutter, Dart \nFirebase, Supabase \nREST, Git\n ',
              //       isHovered: isHovered,
              //     );
              //   },
              // ),

              const Spacer(),
              // SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.kDialogButtonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // child: Center(
                    //   child: CustomTextButton(
                    //     'My Projects',
                    //     onTap: () {},
                    //     fontSize: 13,
                    //   ),
                    // ),
                  ),
                  horizontalMargin4,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.kDialogButtonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: CustomTextButton(
                        'Contact',
                        onTap: () {
                          Navigator.of(context).pop();
                          bloc!.appBarTitleValue.add(MenuItemsConstantKeys.contact);

                          bloc!.showCustomDialog(
                            // context: navigatorKey.currentContext!,
                            context: context,
                            bloc: bloc,
                            title: MenuItemsConstantKeys.contact,
                            // subTitle: 'sub title',
                          );
                        },
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              verticalMargin8,
            ],
          ),
        ),
      ),
    );
  }
}
