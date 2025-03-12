import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/data/service/contact_service.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class PlatformLauncherButtonWidget extends StatelessWidget {
  final String platformUrl;
  final String platformTitle;
  final IconData platformIcon;

  const PlatformLauncherButtonWidget({
    super.key,
    required this.platformUrl,
    required this.platformTitle,
    required this.platformIcon,
  });

  // final ProjectMetadataModel? selectedProject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => _launchUrl(selectedProject.presentIosUrl),
      onTap: () => ContactService.handleUrl(url: platformUrl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              platformIcon,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(width: 3),
            CustomText(
              platformTitle,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
