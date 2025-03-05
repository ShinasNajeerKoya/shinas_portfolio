import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class WindowsMenuItemsIconWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String? notificationCountValue;
  final void Function()? onTap;

  const WindowsMenuItemsIconWidget({
    super.key,
    required this.icon,
    required this.title,
    this.notificationCountValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SizedBox(
                height: 55,
                width: 55,
                // color: Colors.yellow.withOpacity(0.2),
                child: CustomSvgIcon(
                  icon,
                ),
              ),
              const SizedBox(height: 8),
              CustomText(
                title,
                fontWeight: FontWeight.bold,
              ),
            ],
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
          // if (hasSlantedArrow)
          //   Positioned(
          //     bottom: -2,
          //     left: -2,
          //     child: CustomSvgIcon(
          //       height: 16,
          //       isMacOS ? AppIcons.kSlantedArrowMacIcon : AppIcons.kArrowMarkWindowsIcon,
          //     ),
          //   ),
        ],
      ),
    );
  }
}
