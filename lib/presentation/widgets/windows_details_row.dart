import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/helper/contact_button_helper.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class WindowsDetailsRow extends StatelessWidget {
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;
  final bool isHovered;
  final String title;
  final String value;
  final double? valueHeight;
  final double? valueWidth;
  final int? maxLines;
  final IconData? icon;
  final ContactOptionEnum? contactButton;

  const WindowsDetailsRow({
    super.key,
    this.onEnter,
    this.onExit,
    this.isHovered = false,
    required this.title,
    required this.value,
    this.valueHeight,
    this.valueWidth,
    this.maxLines,
    this.icon,
    this.contactButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// First Container (title)
        SizedBox(
          width: 100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: CustomText(
                  title,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        horizontalMargin4,

        /// Second Container
        Expanded(
          child: MouseRegion(
            onEnter: onEnter,
            onExit: onExit,
            child: InkWell(
              onTap: () {
                ContactButtonHelper.handleContactOnTap(context, contactButton!);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: CustomText(
                    value,
                    fontSize: 13,
                    maxLines: maxLines,
                    lineHeight: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),

        horizontalMargin4,

        /// Icon Container

        if (isHovered)
          InkWell(
            onTap: () {
              ContactButtonHelper.handleContactOnTap(context, contactButton!);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                color: Colors.blue,
                size: 16,
              ),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
