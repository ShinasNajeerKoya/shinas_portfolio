import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/featured_project_widget.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_projects_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/platform_laucnher_button_widget.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/projects_gridview_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_divider.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/project_details_overview_row_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/project_title_widget.dart';

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
        // return false;
        return true;
      },
      child: Dialog(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .tertiary,
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
                Expanded(
                  child: StreamBuilder<ProjectMetadataModel?>(
                      stream: bloc!.selectedProject,
                      builder: (context, snapshot) {
                        final selectedProject = snapshot.data;

                        /// for metadata details
                        if (selectedProject == null) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView(
                              children: [
                                ProjectTitleWidget(
                                  title: LocaleKeys.featured.toLocalizeString,
                                ),

                                /// ** featured project **
                                FeaturedProjectWidget(
                                  bloc: bloc,
                                ),

                                ProjectTitleWidget(
                                  title: LocaleKeys.myProjects.toLocalizeString,
                                ),

                                /// ** normal project **
                                ProjectsGridViewWidget(
                                  bloc: bloc,
                                ),
                              ],
                            ),
                          );
                        }

                        /// triggers when any project is selected
                        return Container(
                          alignment: Alignment.center,
                          // color: Colors.blueGrey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        bloc!.selectedProject.add(null);
                                      },
                                      icon: Icon(
                                        CupertinoIcons.left_chevron,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: ListView(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: CustomSvgIcon(selectedProject.icon),
                                          ),
                                          const SizedBox(width: 15),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                selectedProject.englishTitle,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              CustomText(
                                                selectedProject.category,
                                                fontSize: 12,
                                                fontColor: Colors.grey.shade500,
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  if (selectedProject.presentIosUrl.isEmpty &&
                                                      selectedProject.presentAndroidUrl.isEmpty)
                                                    CustomText(
                                                      'Designed for iOS & Android',
                                                      fontSize: 10,
                                                      fontColor: Colors.grey.shade500,
                                                    ),
                                                  if (selectedProject.presentIosUrl.isNotEmpty)
                                                    PlatformLauncherButtonWidget(
                                                      platformUrl: selectedProject.presentIosUrl,
                                                      platformTitle: LocaleKeys.ios.toLocalizeString,
                                                      platformIcon: Icons.apple,
                                                    ),
                                                  if (selectedProject.presentAndroidUrl.isNotEmpty)
                                                    PlatformLauncherButtonWidget(
                                                      platformUrl: selectedProject.presentAndroidUrl,
                                                      platformTitle: LocaleKeys.android.toLocalizeString,
                                                      platformIcon: Icons.android,
                                                    ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 25),
                                      const CustomDivider(
                                          verticalPaddingValue: 20, horizontalPaddingValue: 0),

                                      /// short data column widget
                                      ProjectDetailsOverviewRowWidget(selectedProject: selectedProject),

                                      const CustomDivider(
                                          verticalPaddingValue: 20, horizontalPaddingValue: 10),

                                      /// about this project section
                                      CustomText(
                                        LocaleKeys.aboutThisProject.toLocalizeString,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontColor: Colors.white.withOpacity(0.8),
                                      ),
                                      const SizedBox(height: 8),

                                      CustomText(
                                        selectedProject.appDevelopmentDuration,
                                        fontSize: 10,
                                        fontColor: Colors.grey,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                      const SizedBox(height: 30),

                                      /// project description section
                                      CustomText(
                                        selectedProject.appDescriptionSmall,
                                        fontSize: 12,
                                        fontColor: Colors.white.withOpacity(0.9),
                                      ),
                                      const SizedBox(height: 10),
                                      const CustomDivider(
                                          verticalPaddingValue: 20, horizontalPaddingValue: 0),

                                      /// project preview section
                                      CustomText(
                                        LocaleKeys.preview.toLocalizeString,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontColor: Colors.white.withOpacity(0.8),
                                      ),
                                      const SizedBox(height: 30),

                                      /// list of preview images
                                      Container(
                                        height: 300,
                                        color: Colors.brown.withOpacity(0.2),
                                      ),
                                      const SizedBox(height: 20),

                                      const CustomDivider(
                                          verticalPaddingValue: 20, horizontalPaddingValue: 0),
                                      CustomText(
                                        selectedProject.appDescriptionLarge,
                                        fontSize: 12,
                                        maxLines: 4,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                      const CustomDivider(
                                          verticalPaddingValue: 20, horizontalPaddingValue: 0),
                                      const SizedBox(height: 10),

                                      CustomText(
                                        LocaleKeys.information.toLocalizeString,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontColor: Colors.white.withOpacity(0.8),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        children: [
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.role.toLocalizeString,
                                            subTitle: selectedProject.role,
                                          ),
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.client.toLocalizeString,
                                            subTitle: selectedProject.client,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.teamSize.toLocalizeString,
                                            subTitle: '${selectedProject.teamSize}',
                                          ),
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.duration.toLocalizeString,
                                            subTitle: selectedProject.duration,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.languageSmall.toLocalizeString,
                                            subTitle: selectedProject.language,
                                          ),
                                          InformationDetailsColumnWidget(
                                            title: LocaleKeys.countrySmall.toLocalizeString,
                                            subTitle: selectedProject.country,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
