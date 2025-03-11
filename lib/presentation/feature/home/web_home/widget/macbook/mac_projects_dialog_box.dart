import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_dialog_app_bar.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_divider.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/project_details_overview_row_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/project_title_widget.dart';

class MacProjectsDialogBox extends StatelessWidget {
  final WebHomeBloc? bloc;

  const MacProjectsDialogBox({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
        // return false;
        bloc!.appBarTitleValue.add('Finder');
        return true;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Container(
          height: 320.h,
          width: 700.w,
          padding: horizontalPadding8,
          decoration: BoxDecoration(
            color: AppColors.kMacPrimaryDarkColor,
            borderRadius: BorderRadius.circular(5.r),
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
              verticalMargin6,

              /// **App bar section**
              MacDialogAppBar(
                bloc: bloc,
                title: '',
                titlePadding: 52,
              ),
              verticalMargin6,
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
                              const FeaturedProjectWidget(),
                              ProjectTitleWidget(
                                title: LocaleKeys.myProjects.toLocalizeString,
                              ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        // color: Colors.blueGrey,
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    bloc!.selectedProject.add(null);
                                  },
                                  icon: const Icon(CupertinoIcons.left_chevron),
                                ),
                              ],
                            ),
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
                                      // fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 20,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          width: 50,
                                          height: 20,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            // SizedBox(height: 25),
                            const CustomDivider(verticalPaddingValue: 20, horizontalPaddingValue: 0),

                            /// short data column widget
                            ProjectDetailsOverviewRowWidget(selectedProject: selectedProject),
                            const CustomDivider(verticalPaddingValue: 20, horizontalPaddingValue: 10),
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
                            CustomText(
                              selectedProject.appDescriptionSmall,
                              fontSize: 12,
                              fontColor: Colors.white.withOpacity(0.9),
                            ),
                            const SizedBox(height: 10),
                            const CustomDivider(verticalPaddingValue: 20, horizontalPaddingValue: 0),
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

                            const CustomDivider(verticalPaddingValue: 20, horizontalPaddingValue: 0),
                            CustomText(
                              selectedProject.appDescriptionLarge,
                              fontSize: 12,
                              maxLines: 4,
                              // fontWeight: FontWeight.bold,
                            ),
                            const CustomDivider(verticalPaddingValue: 20, horizontalPaddingValue: 0),
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

                            /*
                            CustomIconButton(
                                onTap: () {
                                  bloc!.selectedProject.add(null);
                                },
                                icon: AppIcons.kCalendarWindowsIcon),
                            CustomText(
                              selectedProject.englishTitle,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              "Key: ${selectedProject.key}",
                              fontSize: 16,
                              fontColor: Colors.white70,
                            ),
                         */
                          ],
                        ),
                      );
                      // return Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: ListView(
                      //     children: [
                      //       ProjectTitleWidget(
                      //         title: LocaleKeys.featured.toLocalizeString,
                      //       ),
                      //       const FeaturedProjectWidget(),
                      //       ProjectTitleWidget(
                      //         title: LocaleKeys.myProjects.toLocalizeString,
                      //       ),
                      //       ProjectsGridViewWidget(
                      //         bloc: bloc,
                      //       ),
                      //     ],
                      //   ),
                      // );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationDetailsColumnWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const InformationDetailsColumnWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title,
              fontSize: 13,
              fontWeight: FontWeight.normal,
              fontColor: Colors.white.withOpacity(0.6),
            ),
            const SizedBox(height: 2),
            CustomText(
              subTitle,
              fontSize: 13,
              fontWeight: FontWeight.normal,
              fontColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
//
// class ProjectsGridViewWidget extends StatelessWidget {
//   final WebHomeBloc? bloc;
//
//   const ProjectsGridViewWidget({
//     super.key,
//     this.bloc,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ProjectMetadataModel>>(
//       future: bloc?.fetchProjectsMetadataFromJson(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(
//             child: CustomText(
//               "No projects available",
//               fontColor: Colors.white,
//             ),
//           );
//         }
//
//         final List<ProjectMetadataModel> normalProjects =
//             snapshot.data!.where((project) => !project.isFeatured).toList();
//
//         return LayoutBuilder(
//           builder: (context, constraints) {
//             int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
//             double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;
//
//             return GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: crossAxisCount,
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 80,
//                 childAspectRatio: aspectRatio,
//               ),
//               itemCount: normalProjects.length,
//               itemBuilder: (context, index) {
//                 final project = normalProjects[index];
//
//                 return ProjectItemWidget(
//                   color: index.isEven ? Colors.blue : Colors.green,
//                   title: project.kannadaTitle,
//                   category: project.category,
//                   imageUrl: project.thumbnailImage,
//                   appIcon: project.icon,
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ProjectsGridViewWidget extends StatelessWidget {
  final WebHomeBloc? bloc;

  const ProjectsGridViewWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProjectMetadataModel>>(
      stream: bloc?.normalProjects,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: CustomText(
              "No projects available",
              fontColor: Colors.white,
            ),
          );
        }

        final normalProjects = snapshot.data ?? [];

        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
            double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;

            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 15,
                mainAxisSpacing: 80,
                childAspectRatio: aspectRatio,
              ),
              itemCount: normalProjects.length,
              itemBuilder: (context, index) {
                final project = normalProjects[index];

                return ProjectItemWidget(
                  title: project.englishTitle,
                  category: project.category,
                  imageUrl: project.thumbnailImage,
                  appIcon: project.icon,
                  bloc: bloc,
                  project: project,
                );
              },
            );
          },
        );
      },
    );
  }
}

class ProjectItemWidget extends StatelessWidget {
  final String title;
  final String category;
  final String imageUrl;
  final String appIcon;
  final WebHomeBloc? bloc;
  final ProjectMetadataModel project;

  const ProjectItemWidget({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.appIcon,
    required this.bloc,
    required this.project,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => bloc!.selectProject(project), // Select the project

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CustomSvgIcon(appIcon),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      category,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontColor: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
                const Spacer(),
                ContainerButton(
                  title: LocaleKeys.see.toLocalizeString,
                  onTap: () {},
                  margin: const EdgeInsets.only(right: 5),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeaturedProjectWidget extends StatelessWidget {
  const FeaturedProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return SizedBox(
          height: 250,
          child: isSmallScreen
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.7],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            AppImages.kMacOsBg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Text Overlay
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CustomText(
                            "Project Title Here",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontColor: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          CustomText(
                            "Category",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontColor: Colors.white.withOpacity(0.8),
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            "Brief Info on app",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontColor: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ContainerButton(
                            title: LocaleKeys.seeMore.toLocalizeString,
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left - Text Content
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const CustomText(
                            "Project Title Here",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontColor: Colors.white,
                          ),
                          const SizedBox(height: 4),
                          CustomText(
                            "Category",
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontColor: Colors.white.withOpacity(0.6),
                          ),
                          const SizedBox(height: 16),
                          const CustomText(
                            "Brief Info on app",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontColor: Colors.white,
                          ),
                          const SizedBox(height: 30),
                          ContainerButton(
                            title: LocaleKeys.seeMore.toLocalizeString,
                            onTap: () {},
                          )
                        ],
                      ),
                    ),

                    // Right - Image
                    SizedBox(
                      width: 500,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.white,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.7],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.dstIn,
                          child: Image.asset(
                            AppImages.kMacOsBg,
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final EdgeInsetsGeometry? margin;

  const ContainerButton({
    super.key,
    required this.title,
    this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: margin ?? EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: CustomText(
          title,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontColor: Colors.blue,
        ),
      ),
    );
  }
}

///

// class ProjectsGridViewWidget extends StatelessWidget {
//   const ProjectsGridViewWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
//         double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;
//
//         // Fetch data from Hive
//         final Box<ProjectMetadata> box = Hive.box<ProjectMetadata>(HiveConstantKeys.projectsBox);
//         final List<ProjectMetadata> projects = box.values.toList();
//
//         if (projects.isEmpty) {
//           return Center(
//               child: CustomText(
//             "No projects available",
//             fontColor: Colors.white,
//           ));
//         }
//
//         return GridView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: crossAxisCount,
//             crossAxisSpacing: 15,
//             mainAxisSpacing: 80,
//             childAspectRatio: aspectRatio,
//           ),
//           itemCount: projects.length,
//           itemBuilder: (context, index) {
//             final project = projects[index];
//
//             return ProjectItemWidget(
//               color: index.isEven ? Colors.blue : Colors.green,
//               title: project.kannadaTitle,
//               category: project.category,
//               imageUrl: project.thumbnailImage,
//             );
//           },
//         );
//       },
//     );
//   }
// }

///

// class ProjectsGridViewWidget extends StatelessWidget {
//   final WebHomeBloc? bloc;
//
//   const ProjectsGridViewWidget({
//     super.key,
//     this.bloc,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Future<List<ProjectMetadataModel>> fetchProjects() async {
//     //   return bloc?.fetchProjectsMetadataFromJson() ?? [];
//     // }
//
//     // return StreamBuilder<List<ProjectMetadataModel>>(
//     //   stream: bloc?.projectsMetadata,
//     //   builder: (context, snapshot) {
//     //     // final projectData = snapshot.data ?? [];
//     //     // log('projectData in widget : ${projectData.first.kannadaTitle}');
//     //
//     //     // if (snapshot.connectionState == ConnectionState.waiting) {
//     //     //   return const Center(child: CircularProgressIndicator());
//     //     // }
//     //
//     //     // if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//     //     //   return Center(
//     //     //     child: CustomText(
//     //     //       "No projects available",
//     //     //       fontColor: Colors.white,
//     //     //     ),
//     //     //   );
//     //     // }
//     //
//     //     final List<ProjectMetadataModel>? normalProjects =
//     //         snapshot.data!.where((project) => !project.isFeatured).toList();
//     //     final List<ProjectMetadataModel> normalProjectsvalue = normalProjects ?? [];
//     //
//     //     return LayoutBuilder(
//     //       builder: (context, constraints) {
//     //         int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
//     //         double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;
//     //
//     //         return GridView.builder(
//     //           physics: const NeverScrollableScrollPhysics(),
//     //           shrinkWrap: true,
//     //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //             crossAxisCount: crossAxisCount,
//     //             crossAxisSpacing: 15,
//     //             mainAxisSpacing: 80,
//     //             childAspectRatio: aspectRatio,
//     //           ),
//     //           itemCount: normalProjectsvalue.length,
//     //           itemBuilder: (context, index) {
//     //             final project = normalProjectsvalue[index];
//     //
//     //             return ProjectItemWidget(
//     //               color: index.isEven ? Colors.blue : Colors.green,
//     //               title: project.kannadaTitle,
//     //               category: project.category,
//     //               imageUrl: project.thumbnailImage,
//     //               appIcon: project.icon,
//     //             );
//     //           },
//     //         );
//     //       },
//     //     );
//     //   },
//     // );
//     FutureBuilder<List<ProjectMetadataModel>>(
//       future: fetchProjects(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(
//             child: CustomText(
//               "No projects available",
//               fontColor: Colors.white,
//             ),
//           );
//         }
//
//         final List<ProjectMetadataModel> normalProjects =
//         snapshot.data!.where((project) => !project.isFeatured).toList();
//
//         return LayoutBuilder(
//           builder: (context, constraints) {
//             int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
//             double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;
//
//             return GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: crossAxisCount,
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 80,
//                 childAspectRatio: aspectRatio,
//               ),
//               itemCount: normalProjects.length,
//               itemBuilder: (context, index) {
//                 final project = normalProjects[index];
//
//                 return ProjectItemWidget(
//                   color: index.isEven ? Colors.blue : Colors.green,
//                   title: project.kannadaTitle,
//                   category: project.category,
//                   imageUrl: project.thumbnailImage,
//                   appIcon: project.icon,
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
//
// // @override
// // Widget build(BuildContext context) {
// //   return LayoutBuilder(
// //     builder: (context, constraints) {
// //       int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
// //       double aspectRatio = crossAxisCount == 2 ? 1.5 : 1.8;
// //
// //       // Fetch data from Hive
// //       final Box<ProjectMetadata> box = Hive.box<ProjectMetadata>(HiveConstantKeys.projectsBox);
// //
// //       // Filter only normal projects (isFeatured == false)
// //       final List<ProjectMetadata> normalProjects =
// //           box.values.where((project) => !project.isFeatured).toList();
// //
// //       if (normalProjects.isEmpty) {
// //         return Center(
// //           child: CustomText(
// //             "No projects available",
// //             fontColor: Colors.white,
// //           ),
// //         );
// //       }
// //
// //       return GridView.builder(
// //         physics: const NeverScrollableScrollPhysics(),
// //         shrinkWrap: true,
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: crossAxisCount,
// //           crossAxisSpacing: 15,
// //           mainAxisSpacing: 80,
// //           childAspectRatio: aspectRatio,
// //         ),
// //         itemCount: normalProjects.length,
// //         itemBuilder: (context, index) {
// //           final project = normalProjects[index];
// //
// //           return ProjectItemWidget(
// //             color: index.isEven ? Colors.blue : Colors.green,
// //             title: project.kannadaTitle,
// //             category: project.category,
// //             imageUrl: project.thumbnailImage,
// //             appIcon: project.icon,
// //           );
// //         },
// //       );
// //     },
// //   );
// // }
// }

//
// class FeaturedProjectWidget extends StatelessWidget {
//   const FeaturedProjectWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       // color: Colors.yellow.withOpacity(0.2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Left child - Column
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 const CustomText(
//                   "Project Title Here",
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   fontColor: Colors.white,
//                 ),
//                 const SizedBox(height: 4),
//                 CustomText(
//                   "Category",
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   fontColor: Colors.white.withOpacity(0.6),
//                 ),
//                 const SizedBox(height: 16),
//                 const CustomText(
//                   "Brief Info on app",
//                   fontSize: 16,
//                   fontWeight: FontWeight.normal,
//                   fontColor: Colors.white,
//                 ),
//                 const SizedBox(height: 30),
//                 ContainerButton(
//                   title: LocaleKeys.seeMore.toLocalizeString,
//                   onTap: () {},
//                 )
//               ],
//             ),
//           ),
//
//           // Right child - Image with fade effect
//           SizedBox(
//             width: 500,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.r),
//               child: ShaderMask(
//                 shaderCallback: (Rect bounds) {
//                   return const LinearGradient(
//                     begin: Alignment.centerRight,
//                     end: Alignment.centerLeft,
//                     colors: [
//                       Colors.white,
//                       Colors.transparent,
//                     ],
//                     stops: [0.0, 0.7],
//                   ).createShader(bounds);
//                 },
//                 blendMode: BlendMode.dstIn, // Applies the fade effect
//                 child: Image.asset(
//                   AppImages.kMacOsBg,
//                   fit: BoxFit.cover,
//                   height: 250,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
