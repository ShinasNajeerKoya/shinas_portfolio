import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_projects_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

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
