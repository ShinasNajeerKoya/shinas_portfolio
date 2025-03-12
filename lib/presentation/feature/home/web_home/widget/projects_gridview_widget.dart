import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/data/model/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_projects_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/project_item_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

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
          return const Center(
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
