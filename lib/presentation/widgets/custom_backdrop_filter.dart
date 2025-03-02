import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackdropFilter extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;

  const CustomBackdropFilter({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    required this.child,
    this.padding,
    this.margin,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
        child: Container(
          width: width ?? 250,
          height: height ?? 50.h,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border:border?? Border.all(color: borderColor ?? Colors.white.withOpacity(0.2)), // Light border
          ),
          child: child, // Allowing custom widgets inside
        ),
      ),
    );
  }
}
