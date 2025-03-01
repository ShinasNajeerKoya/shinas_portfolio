import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/helper/desktop_layout_helper.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';

class MacIconWidget extends StatelessWidget {
  final MainLayoutEnum layout;
  final String? notificationCountValue;
  final bool hasSlantedArrow;

  const MacIconWidget({
    super.key,
    required this.layout,
    this.notificationCountValue,
    this.hasSlantedArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          // color: Colors.yellow.withOpacity(0.2),
          child: CustomSvgIcon(
            DesktopLayoutHelper.getMainLayoutIcon(layout),
          ),
        ),
        if (notificationCountValue != null)
          Positioned(
            top: -6,
            right: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                notificationCountValue ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        // Slanted Arrow (For Projects, GitHub, and LinkedIn)
        if (hasSlantedArrow)
          const Positioned(
            bottom: -2,
            left: -2,
            child: CustomSvgIcon(
              height: 16,
              AppIcons.kSlantedArrowMacIcon,
            ),
          ),
      ],
    );
  }
}
