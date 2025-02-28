import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class DetailsRow extends StatelessWidget {
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;
  final bool isHovered;
  final String title;
  final String value;
  final double? valueHeight;
  final double? valueWidth;

  const DetailsRow({
    super.key,
    this.onEnter,
    this.onExit,
    required this.isHovered,
    required this.title,
    required this.value,
    this.valueHeight,
    this.valueWidth,
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
        Container(
          width: valueWidth ?? 200,
          height: valueHeight,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: CustomText(
            value,
            fontSize: 13,
            maxLines: 10,
          ),
        ),
      ],
    );
  }
}
