import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? horizontalPaddingValue;
  final double? verticalPaddingValue;

  const CustomDivider({
    super.key,
    this.horizontalPaddingValue,
    this.verticalPaddingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPaddingValue ?? 20, vertical: verticalPaddingValue ?? 8),
      child: Divider(
        height: 0.5,
        // endIndent: 10,
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
