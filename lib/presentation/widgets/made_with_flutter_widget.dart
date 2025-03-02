import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class MadeWithFlutterWidget extends StatelessWidget {
  const MadeWithFlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackdropFilter(
      borderRadius: 50.r,
      height: 25,
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSvgIcon(
            AppIcons.kFlutterIcon,
            height: 14,
          ),
          const SizedBox(width: 4),
          const CustomText(
            "Made with  ",
            fontSize: 13,
            fontWeight: FontWeight.w100,
          ),
          AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 350),
            animatedTexts: [
              buildRotateAnimatedText('Flutter'),
              buildRotateAnimatedText('Care'),
              buildRotateAnimatedText('Love'),
            ],
          ),
        ],
      ),
    );
  }

  RotateAnimatedText buildRotateAnimatedText(String text) {
    return RotateAnimatedText(
      text,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
