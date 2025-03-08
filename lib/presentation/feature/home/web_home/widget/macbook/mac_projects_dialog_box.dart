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
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
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
        return false;
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
                child: Padding(
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
                ),
              )
            ],
          ),
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
                  color: index.isEven ? Colors.blue : Colors.green,
                  title: project.englishTitle,
                  category: project.category,
                  imageUrl: project.thumbnailImage,
                  appIcon: project.icon,
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
  final Color color;
  final String title;
  final String category;
  final String imageUrl;
  final String appIcon;

  const ProjectItemWidget({
    required this.color,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.appIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: color,
        // image: Dec,
        // image: DecorationImage(image: AssetImage(AppImages.kWindowsOsBg)),
        borderRadius: BorderRadius.circular(10),
      ),
      // padding: const EdgeInsets.all(8),
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
