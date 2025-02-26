import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackdropFilter extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Widget child;

  const CustomBackdropFilter({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    required this.child,
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
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2), // Semi-transparent glass effect
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(color: borderColor ?? Colors.white.withOpacity(0.2)), // Light border
          ),
          child: child, // Allowing custom widgets inside
        ),
      ),
    );
  }
}
