import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color? fontColor;
  final Function()? onTap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;

  const CustomTextButton(
    this.text, {
    super.key,
    required this.onTap,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomText(
        text,
        fontColor: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textAlign: textAlign,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
      ),
    );
  }
}
