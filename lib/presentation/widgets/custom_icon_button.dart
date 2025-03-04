import 'package:flutter/material.dart';
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
        height: height ?? 15,
        width: width ?? 18,
        // color: Colors.brown,
        child: CustomSvgIcon(
          icon,
          color: iconColor ?? Colors.white,
        ),
      ),
    );
  }
}
