import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_projects_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class FeaturedProjectWidget extends StatelessWidget {
  final WebHomeBloc? bloc;

  const FeaturedProjectWidget({
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
            return const Center(
              child: CustomText(
                "No projects available",
                fontColor: Colors.white,
              ),
            );
          }

          /// featured project will be from normal project but first index
          final featuredProjects = snapshot.data ?? [];
          final project = featuredProjects.first;

          return LayoutBuilder(
            builder: (context, constraints) {
              bool isSmallScreen = constraints.maxWidth < 600;

              return InkWell(
                onTap: () => bloc!.selectProject(project),
                child: SizedBox(
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
                                    project.thumbnailImage,
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
                                  CustomText(
                                    project.englishTitle,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontColor: Colors.white,
                                  ),
                                  const SizedBox(height: 4),
                                  CustomText(
                                    project.category,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontColor: Colors.white.withOpacity(0.8),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomText(
                                    project.appDescriptionSmall,
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
                                  CustomText(
                                    project.englishTitle,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontColor: Colors.white,
                                  ),
                                  const SizedBox(height: 4),
                                  CustomText(
                                    project.category,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontColor: Colors.white.withOpacity(0.6),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomText(
                                    project.appDescriptionSmall,
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
                                    project.thumbnailImage,
                                    fit: BoxFit.cover,
                                    height: 250,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              );
            },
          );
        });
  }
}
