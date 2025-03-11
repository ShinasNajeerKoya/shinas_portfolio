import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: VerticalDivider(
        width: 0.5,
        color: Colors.grey.withOpacity(0.8),
      ),
    );
  }
}
