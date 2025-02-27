import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';

class MacOSButton extends StatelessWidget {
  final Color color;
  final String? icon;
  final Color? iconColor;
  final Function()? onTap;

  final bool isHovered;

  const MacOSButton({
    super.key,
    required this.color,
    this.icon,
    this.onTap,
    this.iconColor,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 8.h,
        height: 8.w,
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: isHovered
            ? Center(
                child: CustomSvgIcon(
                  icon ?? AppIcons.kBlankIcon,
                  color: iconColor ?? Colors.transparent,
                ),
              )
            : null,
      ),
    );
  }
}
