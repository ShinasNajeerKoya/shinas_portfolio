import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackdropFilter extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget child;

  const CustomBackdropFilter({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
        child: Container(
          width: width ?? 200.w,
          height: height ?? 50.h,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2), // Semi-transparent glass effect
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(color: Colors.white.withOpacity(0.2)), // Light border
          ),
          child: child, // Allowing custom widgets inside
        ),
      ),
    );
  }
}
