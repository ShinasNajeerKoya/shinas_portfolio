import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';

class CustomIconButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String icon;
  final Color? iconColor;
  final Function()? onTap;

  const CustomIconButton({
    super.key,
    this.height,
    this.width,
    required this.onTap,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 12.h,
        width: height ?? 15.w,
        // color: Colors.brown,
        child: CustomSvgIcon(
          icon,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }
}
