import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_divider.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class ProjectTitleWidget extends StatelessWidget {
  final String title;

  const ProjectTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            title,
            fontSize: 30,
          ),
          const CustomDivider(horizontalPaddingValue: 0),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
