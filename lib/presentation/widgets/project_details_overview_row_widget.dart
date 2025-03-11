import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_vertical_divider.dart';

class ProjectDetailsOverviewRowWidget extends StatelessWidget {
  final ProjectMetadataModel selectedProject;

  const ProjectDetailsOverviewRowWidget({
    required this.selectedProject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      // color: Colors.purple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProjectOverviewItem(
            title: LocaleKeys.company.toLocalizeString,
            centerWidget: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white.withOpacity(0.8),
              size: 28,
            ),
            subTitle: selectedProject.client,
          ),
          const CustomVerticalDivider(),
          ProjectOverviewItem(
            title: LocaleKeys.country.toLocalizeString,
            centerWidget: CustomText(
              selectedProject.countryCode.toUpperCase(),
              fontSize: 22,
              letterSpacing: 1.5,
              fontColor: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
            subTitle: selectedProject.country,
          ),
          const CustomVerticalDivider(),
          ProjectOverviewItem(
            title: LocaleKeys.language.toLocalizeString,
            centerWidget: CustomText(
              selectedProject.languageCode.toUpperCase(),
              fontSize: 22,
              letterSpacing: 1.5,
              fontColor: Colors.grey.shade300,
              fontWeight: FontWeight.bold,
            ),
            subTitle: selectedProject.language,
          ),
          const CustomVerticalDivider(),
          ProjectOverviewItem(
            title: LocaleKeys.category.toLocalizeString,
            centerWidget: Icon(
              Icons.coffee,
              color: Colors.white.withOpacity(0.8),
              size: 28,
            ),
            subTitle: selectedProject.category,
          ),
          const CustomVerticalDivider(),
          ProjectOverviewItem(
            title: LocaleKeys.platforms.toLocalizeString,
            centerWidget: Icon(
              Icons.business_center,
              color: Colors.white.withOpacity(0.8),
              size: 28,
            ),
            subTitle: 'add platforms to json',
          ),
        ],
      ),
    );
  }
}

class ProjectOverviewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget centerWidget;

  const ProjectOverviewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.centerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title,
          fontSize: 11,
          letterSpacing: 1.05,
          fontWeight: FontWeight.bold,
          fontColor: Colors.white.withOpacity(0.6),
        ),
        centerWidget,
        CustomText(
          subTitle,
          fontSize: 11,
          fontColor: Colors.white.withOpacity(0.6),

          // fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
