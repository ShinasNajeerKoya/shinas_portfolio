import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class MacDetailsRow extends StatelessWidget {
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;
  final bool isHovered;
  final String title;
  final String value;
  final double? valueHeight;
  final double? valueWidth;
  final int? maxLines;

  const MacDetailsRow({
    super.key,
    this.onEnter,
    this.onExit,
    required this.isHovered,
    required this.title,
    required this.value,
    this.valueHeight,
    this.valueWidth,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// First Container (Hoverable, Center-Right, Wraps Text)
        MouseRegion(
          onEnter: onEnter,
          onExit: onExit,
          child: SizedBox(
            width: 100,
            child: Align(
              alignment: Alignment.centerRight,
              child: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: isHovered ? Colors.white.withOpacity(0.4) : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CustomText(
                    title,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        horizontalMargin4,

        /// Second Container (Fixed, Rounded Borders)
        Expanded(
          child: Container(
            // width: valueWidth ?? 200.w,
            // height: valueHeight,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: CustomText(
                value,
                fontSize: 13,
                maxLines: maxLines,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
