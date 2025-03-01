import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? fontColor;
  final double? letterSpacing;
  final int? maxLines;

  const CustomText(
    this.text, {
    super.key,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.maxLines,
    this.letterSpacing,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        letterSpacing: letterSpacing,
        color: fontColor ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
      // style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
